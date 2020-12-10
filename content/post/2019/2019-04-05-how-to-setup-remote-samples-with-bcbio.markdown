---
title: 'How to set up public dataset analysis with bcbio-nextgen'
tags: [bcbio, public-data]
published: true
date: 2019-04-05 10:13:02.000000000 -04:00
---

We use [bcbio-nextgen](https://github.com/bcbio/bcbio-nextgen) for the analysis of sequencing data, mainly, (sc)RNAseq,
smallRNAseq, DNASeq and ChIPSeq. It is not rare that we get collaborators who
wants to re-analyze public data-set. 

Inside `bcbio`, we have [`bcbio_prepare_samples.py`](https://bcbio-nextgen.readthedocs.io/en/latest/contents/configuration.html#multiple-files-per-sample) 
to help to merge multiple
files that belong to the same sample into one file to make easier the configuration
of **bcbio**. We extended this script to pull down data from [GEO](https://www.ncbi.nlm.nih.gov/geo/) and 
[SRA](https://www.ncbi.nlm.nih.gov/sra) repository.

If you have **bcbio**. installed, you can create a `example.csv` file like this:

```
samplenames,description
GSM3508215,HEK293T
SRR8311268,Hela
```

And then run:

```
bcbio_prepare_samples.py --csv example.csv --out fastq
```

This will download and create all the files inside `fastq` folder. If the samples 
is paired-end, it will generated the two associated files: R1 and R2.

Cool options to use:

* `--remove-source`: if you want to keep only final files.
* you can use full FTP addresses as well under `samplenames` column

[NextFlow](https://www.nextflow.io/index.html) accepts these SRA ids as well, [take a look](https://www.nextflow.io/blog/2019/release-19.03.0-edge.html).

And [sra-explorer](https://ewels.github.io/sra-explorer/) from [Phil Ewels](https://github.com/ewels)
 will create a bash script to download the FASTQ files and It has a great search engine where
you can use any of these terms to find your public data:
`GSE30567, SRP043510, PRJEB8073, ERP009109 or human liver miRNA.`

The only advantage of **bcbio** is that in the case of multiple files associated to the same 
sample, it will merge the files together. For instance, if you search in **sra-explorer** for this  
term: `GSM2598386`, you see that multiple files. **bcbio**. will merge all  of them into one and 
you can run your pipeline directly afterwards. And pretty convenient if you 
use any of the **bcbio** pipelines :).

Enjoy!
  
> "happiness in bioinformatics: when your collaborators give you  a CSV file 
> with all the metadata for your raw data and they match.