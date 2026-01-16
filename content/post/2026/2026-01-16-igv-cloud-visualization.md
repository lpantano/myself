---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Bringing IGV webapp to Your Cloud Workspace in Seqera"
subtitle: "Bringing IGV visualization directly to your cloud workspace eliminates the download-to-view cycle"
summary: "Run IGV directly in your cloud workspace with automatic track discovery. Eliminate downloads and view genomic data where it lives. Open source proof of concept for Seqera Platform users."
authors: []
tags: ["bioinformatics", "cloud-computing", "data-pipelines", "genomics", "visualization", "workflow-optimization"]
categories: ["Data at Scale"]
date: 2026-01-16T12:00:00-04:00
lastmod: 2026-01-16T12:00:00-04:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

You just ran a genomic pipeline that generated 50GB of BAM files in the cloud. Now you need to check alignment quality. Do you really have to download everything to run IGV locally?

## The Workflow Gap

Analysis happens in the cloud. Fast compute, scalable storage, pipelines that finish overnight.

Visualization happens locally. Manual downloads, disk space constraints, waiting for transfers to complete.

This gap slows iteration. It wastes time. And it's fixable.

## What Cloud-Native Visualization Looks Like

I built an integration that runs IGV as a web app directly in Seqera workspaces. It connects to the same cloud storage your pipelines write to. It automatically discovers all genomic files. Zero download, zero manual file loading.

If your entire workflow is local and your BAM files are small, this might be more complexity than you need. But if you're running pipelines in the cloud and tired of downloading results just to QC them, this eliminates real friction.

## How It Works

The container combines IGV web app with Seqera's connect-client. The connect-client uses FUSE to mount cloud storage, making remote files appear local to IGV.

A startup script scans mounted directories for genomic files—BAM, CRAM, VCF, BED, BigWig, anything IGV can read. It detects file formats, checks for index files, and generates a track catalog. IGV reads this catalog and populates a custom "Auto-discovered Tracks" menu.

The visualization tool comes to where data already lives.

## What This Looks Like in Practice

Launch the IGV Studio from your Seqera interface. Your browser opens with the IGV web app.

Click Tracks → Auto-discovered Tracks. See a table of all your BAM files, VCF variants, coverage tracks—everything in your mounted storage.

Click to load. Instant visualization.

## Why This Matters

**Skip the download wait.** Checking alignments after a pipeline run no longer means waiting hours for transfers.

**Stop duplicating storage.** No local copies means hundreds of GB saved per researcher.

**Share results faster.** Send a browser URL instead of transferring massive files.

**Onboard easier.** New team members don't need complex local setups. They click a link and start viewing data.

**Improve reproducibility.** Everyone views the same authoritative data source in cloud storage, not their own potentially outdated local copies.

## Getting Started

**Important context:** This solution is specifically for Seqera Platform users. If you're using other platforms like Terra, AnVIL, Galaxy, or DNAnexus, they have their own approaches to interactive visualization. This implementation leverages Seqera's Studios feature and connect-client architecture.

The full implementation is open source in the [Seqera custom studios examples repository](https://github.com/seqeralabs/custom-studios-examples/tree/main/igv). You'll find:

- Complete Dockerfile with multi-stage build
- Automatic track discovery script
- Deployment documentation
- Configuration examples

**Maturity note:** This is a proof of concept tested on several datasets. It demonstrates the pattern and should help you get started, but expect to adapt it for production use. Test thoroughly with your own data and file structures.

The code is customizable. Adapt the track discovery logic for your file naming conventions. Change the reference genome. Add authentication if needed.

## The Broader Pattern

Cloud-native analysis means rethinking entire workflows, not just moving compute. Bringing visualization to cloud data is part of that shift.

Other platforms (Terra, AnVIL) mount cloud storage for interactive apps too. What makes this useful is the automatic track discovery—most solutions require manual file paths.

The less time you spend moving data around, the more time you spend understanding it.

---

**References:**

- Robinson JT, et al. (2011). Integrative genomics viewer. Nature Biotechnology 29(1):24-26. [DOI: 10.1038/nbt.1754](https://www.nature.com/articles/nbt.1754)
- [IGV Web App Documentation](https://igv.org/doc/webapp/)
- [Seqera Studios Documentation](https://docs.seqera.io/platform-cloud/studios/)
- [Implementation Repository](https://github.com/seqeralabs/custom-studios-examples/tree/main/igv)
