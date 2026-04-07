---
title: Single-Cell RNA-Seq Analysis Reports
summary: Code templates and training materials for single-cell RNA-seq downstream analysis
tags:
  - Bioinformatics
  - Single-Cell
  - Visualization
  - R
  - Seurat
categories:
  - Bioinformatics
date: "2026-01-13"
featured: true
url_code: "https://github.com/bcbio/singlecell-reports"
url_demo: "https://bcbio.github.io/singlecell-reports/"
links:
  - name: Code
    url: https://github.com/bcbio/singlecell-reports
  - name: Docs
    url: https://bcbio.github.io/singlecell-reports/
---

## Overview

A collection of code templates and training materials for performing downstream analysis following single-cell RNA preprocessing. This repository provides standardized workflows for researchers working with scRNA-seq data, from quality assessment to differential expression.

[**View Documentation →**](https://bcbio.github.io/singlecell-reports/) | [**GitHub Repository →**](https://github.com/bcbio/singlecell-reports)

## Key Features

- **Quality Assessment**: Templates for evaluating scRNA and scATAC data quality
- **Integration Analysis**: Workflows for combining multiple samples with batch effect correction
- **Differential Expression**: Multiple approaches including pseudobulk analysis via DESeq2 and MAST methodology
- **Compositional Analysis**: Methods for examining cell-type abundance changes across conditions
- **Gene Imputation**: Techniques using ALRA and MAGIC algorithms to address data sparsity
- **Pipeline Integration**: Support for nf-core scrnaseq pipeline outputs and standalone Cell Ranger processing

## Technical Stack

Built primarily in R with supporting shell scripts:
- Seurat for single-cell data handling and analysis
- DESeq2 for differential expression analysis
- Harmony for batch effect correction
- nf-core scrnaseq pipeline integration
- Quarto and R Markdown for reproducible reports

## Development Status

Templates are labeled with revision tiers:
- **Stable**: Fully tested and production-ready
- **Alpha**: Functional but requires additional testing
- **Draft**: Under active development, may need manual parameter tuning

## Why This Matters

Single-cell RNA-seq analysis requires specialized knowledge and tools. This project reduces the learning curve for new single-cell researchers, provides validated workflows following community best practices, enables reproducible analysis through standardized templates, and integrates seamlessly with popular preprocessing pipelines.

For more information or to contribute, visit the [GitHub repository](https://github.com/bcbio/singlecell-reports) or explore the [documentation](https://bcbio.github.io/singlecell-reports/).
