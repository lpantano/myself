# Research Notes: IGV-Seqera Integration

## Technical Components

### IGV (Integrative Genomics Viewer)
- **What it is**: High-performance genomic visualization tool developed by the Broad Institute
- **Use cases**: Viewing aligned reads (BAM/CRAM), variants (VCF), genomic annotations (BED/GTF), coverage tracks (BigWig)
- **Traditional usage**: Desktop application or web app with manual file loading
- **Official documentation**: https://igv.org/doc/webapp/

### Seqera Platform (formerly Nextflow Tower)
- **What it is**: Platform for managing and scaling computational workflows
- **Studios feature**: Interactive applications (RStudio, Jupyter, etc.) that connect to cloud data
- **Key capability**: Mounts cloud storage (S3, GCS, Azure) directly into containerized applications
- **Documentation**: https://docs.seqera.io/platform-cloud/studios/

### Connect-Client
- **Purpose**: Seqera's tool to bridge between cloud storage and containerized applications
- **Function**: Uses FUSE to mount remote data as local filesystem
- **Benefit**: Applications access cloud data as if it were local, without downloading
- **Repository**: https://github.com/seqeralabs/connect-client

## Implementation Details

### Problem Solved
Traditional genomic workflow friction points:
1. **Data transfer bottleneck**: BAM files are often 10-100+ GB; downloading takes hours
2. **Storage duplication**: Keeping local copies wastes disk space
3. **Manual loading**: Each analysis requires individually loading multiple files into IGV
4. **Version confusion**: Hard to ensure everyone views the same data version
5. **Collaboration barriers**: Sharing requires sending large files or complex instructions

### Solution Architecture
The implementation creates a containerized IGV web app that:
1. Uses connect-client to mount Seqera datalinks to `/workspace/data/`
2. Runs a startup script (`generate-session.sh`) that:
   - Scans mounted directories for genomic files (.bam, .vcf, .bed, etc.)
   - Detects file formats and checks for index files (.bai, .tbi, .crai)
   - Generates a CSV catalog of discovered tracks
   - Creates IGV custom data modal configuration JSON
   - Updates IGV's track registry to show "Auto-discovered Tracks" menu
3. Serves IGV web app via http-server
4. Makes all discovered tracks instantly loadable through IGV's interface

### Key Technical Files
- **Dockerfile**: Multi-stage build (fetch connect-client, build IGV from source, create runtime)
- **generate-session.sh**: Bash script for automatic track discovery
- **Supported formats**: BAM, CRAM, VCF, BED, GFF/GTF, BigWig, BedGraph, SEG files

### Automatic Track Discovery Logic
The script:
- Recursively searches `/workspace/data/`
- Uses case-insensitive pattern matching for file extensions
- Warns if index files are missing for alignment files (BAM/CRAM)
- Categorizes tracks by type (Alignment, Variant, Annotation, Coverage, Segment)
- Creates symlink from `/workspace/data/` to `/app/data/` for URL paths
- Modifies IGV's trackRegistry.json to register the auto-discovered tracks

## Scientific Context

### Why Visualization Matters in Genomics
- **Quality control**: Inspecting alignment quality, coverage uniformity, PCR duplicates
- **Variant validation**: Confirming SNPs/indels aren't artifacts, checking read support
- **Biological interpretation**: Identifying splice junctions, structural variants, expression patterns
- **Troubleshooting**: Diagnosing pipeline issues by examining intermediate outputs

### Current Workflow Challenges (Research Pain Points)
Based on common bioinformatics practices:
- **Iteration speed**: Waiting for downloads slows pipeline optimization cycles
- **Storage management**: Labs accumulate terabytes of duplicate data across local machines
- **Reproducibility**: "Works on my machine" when different team members have different file versions
- **Onboarding**: New lab members struggle to set up complex local toolchains

### Cloud-Native Analysis Trend
The field is shifting toward:
- Running analyses where data is stored (cloud compute)
- Interactive analysis environments (notebooks, RStudio)
- Reducing data movement (minimize egress costs and time)
- Reproducible containerized tools

This IGV integration aligns with that trend by keeping visualization in the same environment as computation.

## Sources

### Primary Technical Documentation
- IGV Web App: https://igv.org/doc/webapp/
- IGV User Guide: https://igv.org/doc/
- IGV GitHub: https://github.com/igvteam/igv-webapp
- Seqera Studios: https://docs.seqera.io/platform-cloud/studios/
- Seqera Custom Studios Examples: https://github.com/seqeralabs/custom-studios-examples

### IGV Publication
- Robinson JT, et al. (2011). "Integrative genomics viewer." Nature Biotechnology 29(1):24-26.
- DOI: 10.1038/nbt.1754
- https://www.nature.com/articles/nbt.1754

### Related Concepts
- Cloud genomics best practices (NHGRI AnVIL, Terra, DNAnexus platforms)
- FUSE filesystems for cloud storage mounting
- Containerization for reproducible bioinformatics (Docker, Singularity)

## Implementation Repository
The code is available at:
https://github.com/seqeralabs/custom-studios-examples/tree/main/igv

This provides:
- Complete Dockerfile for building the IGV Studio
- Bash script for automatic track discovery
- Documentation for deployment and usage
- Configuration examples for common genomic workflows
