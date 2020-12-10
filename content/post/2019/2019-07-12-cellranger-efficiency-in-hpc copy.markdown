---
title: 'How to set up cellranger to make your hpc admin happy'
tags: [hpc, singlecell]
published: true
date: 2019-07-11
---

I found myself to force to use [cellranger](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/advanced/cluster-mode). Meanwhile it helps a lot to
run from [bcl](https://www.illumina.com/informatics/sequencing-data-analysis/sequence-file-formats.html) files to single cell counts matrixes, I discovered that is
quite difficult to control many options related to optimization.

I have to run more than 200 samples in a short time of period. In my current
position at MIT, I joined the OpenMind cluster in the McGovern institute. I was
pleased to find a very flexible cluster, but as any other cluster you need to
respect other users.

My samples are human samples, so I need a lot of memory so [STAR](https://github.com/alexdobin/STAR) can run. The
command line is easy to set up:

`cellranger count --id=SAMPLE --transcriptome=GRCh38_pre_mRNA --fastqs=PATH2FASTQS --sample=SAMPLE`

Of course, that is in local mode. If you want to set up a job to a cluster,
it would look like this:

```
#!/bin/bash
#SBATCH -N 1
#SBATCH -c 6
#SBATCH --mem=12000
#SBATCH -t 0-48:00:00
#SBATCH -J cellr
#SBATCH -e job-counts.e
#SBATCH -o job-counts.o
## SBATCH --mail-type=END,FAIL # this line is commented
## SBATCH --mail-user=user@mit.edu  # this line is commented

cellranger count --id=SAMPLE --transcriptome=GRCh38_pre_mRNA \
          --fastqs=PATH2FASTQS --sample=SAMPLE \
          --localcores=6 --localmem=120

```

The main problem with that is you are using 120G during all the process that could
go to 1-2 days.

I discovered that you can setup the ` cluster` mode to make `cellranger` to send
jobs to the cluster. However, `slurm` is not a option to the documentation, BUT
you can specify a template file:

```
#!/bin/bash
#SBATCH -J __MRO_JOB_NAME__
#SBATCH -N 1
#SBATCH -c __MRO_THREADS__
#SBATCH --mem=__MRO_MEM_GB__G
#SBATCH -o __MRO_STDOUT__
#SBATCH -e __MRO_STDERR__
#SBATCH -t 0-48:00:00
#SBATCH --qos="normal"

 __MRO_CMD__
```

The command would look like this:

```
cellranger count --id=SAMPLE --transcriptome=GRCh38_pre_mRNA \
          --fastqs=PATH2FASTQS --sample=SAMPLE \
          --jobmode=slurm.template \
          --maxjobs=3 --jobinterval=1000

```

I was feeling victory, ha ha ha, BUT I saw that the `ALIGN` step was requesting
220G of memory.... WHAT!!!!!????? or better [WATTT????!!!!!](https://www.destroyallsoftware.com/talks/wat).

**note**: this is set up during genome generation with the parameters:

```

    --memgb=<num>       Maximum memory (GB) used when aligning reads with STAR.
                          Defaults to 16.
```

**note**: default is 16G but if I use that then my jobs are cancelled because using more memory than requested, as I expected considering STAR needs more than that for human genome.

I guess I didn't look at the first place I should have looked, but it took me
some time to discovered that the memory is coming from a file in the reference
genome folder:

```
cat GRCh38_pre_mRNA/reference.json
{
    "fasta_hash": "954a9c3916ef1544c9358445440b9683fc061c71",
    "genomes": [
        "GRCh38_pre_mRNA"
    ],
    "gtf_hash": "12aae438159b35282adaf643cca4dc5887b0448a",
    "input_fasta_files": [
        "Homo_sapiens.GRCh38.dna.toplevel.fa"
    ],
    "input_gtf_files": [
        "GRC38_preRNA.gtf"
    ],
    "mem_gb": 220,
    "mkref_version": "3.0.2",
    "threads": 24,
    "version": null
}
```

I realized that when I found, after 100 `ls/cat/less/grep`, this file with these
lines of code:

```
cellranger-3.0.2/cellranger-cs/3.0.2/lib/python/cellranger/utils.py
def _load_reference_metadata_file(reference_path):
    reference_metadata_file = os.path.join(reference_path, cr_constants.REFERENCE_METADATA_FILE)
    with open(reference_metadata_file, 'r') as f:
        return json.load(f)
```

So, easy peasy, I changed that to 110. I relaunched the job I was using to test,
and found that it was still setting up 220G...WHY!?!!? well, it seems if you relaunch
in a step where the alignment has already begun, there is a cache for the resources.
So after more time trying to figure out this and asking myself, why I decided my
career path to be bioinformatics, I tried a fresh start and...IT WORKED.

> How happy one can be to see a job requesting the expected resources.

> Incredible happy!

I went a step further, and looked how much memory actually it was using during the
alignment step, and I saw that actually only needs 64G, so I updated to 72G, to
gain more karma from the HPC world.

There is one more thing, that will set jobs of 72G and 4 cores, if you want to
increase the number of cores, then use this option `--mempercore 6` or whatever number
that you want: `mempercore = 72G/final_cores`.

## Workflow

Finally, I felt that I was doing my best to behave and avoid making angry other
people using the hpc. The final setup looks like this:


* meta-script to send all the samples to a master job: `runner.sh`. It accepts
      a file where first column is `sample name` and second column is `fastq_path`
```
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value
# set -v # you can uncomment all these lines to have a better debugging
# set -x
# export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

while IFS=" " read -r sample paths

do

RUN=0
if [[ ! -e $sample/filtered_feature_bc_matrix.h5 ]]; then
    RUN=1 # run if the final output is not there yet
fi

if [[  -e  $sample/_lock ]]; then
    echo $sample is locked, please:
    echo rm $sample/_lock
    RUN=0 # but don't do anything if is locked
fi

if [[ $RUN == 1 ]]; then
    echo sbatch -J $sample -o logs/$sample.o -e logs/$sample.e scripts/om-counts-cluster.slurm $sample $paths
    sbatch -J $sample -o logs/$sample.o -e logs/$sample.e scripts/om-counts-cluster.slurm $sample $paths
fi

done < $1
```

* SBATCH script with cellranger command: `counter.slurm`
```
#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=6000
#SBATCH -t 0-48:00:00
# SBATCH -J "cellr-$1"
# SBATCH -e job-counts-$1.e
# SBATCH -o job-counts-$1.o
## SBATCH --mail-type=END,FAIL # this line is commented
## SBATCH --mail-user=user@mit.edu  # this line is commented

SCRIPTPATH="PATHTOSCRIPTS"
cellranger count --id=$1 --transcriptome=GRCh38_pre_mRNA --fastqs=$2 --sample=$1 --jobmode=$SCRIPTPATH/slurm.template --maxjobs=3 --jobinterval=1000

if [ $? -eq 0 ]; then
    echo OK
    mv $1 results/.
else
    echo $1 FAIL
fi
```

* template script for `cellranger` as shown above


### Other tips

I used `mxjobs=3` to avoid a lot of jobs. I am testing how things go, this could be spanned to bigger numbers.

I used `jobinterval=1000` to avoid sending jobs at the same time, just in case, but I don't have any proof to support this.


> "happiness in bioinformatics:
