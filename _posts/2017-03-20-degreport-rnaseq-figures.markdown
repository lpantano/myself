---
title: 'DEGreport to plot nice RNA-seq figures'
tags: [viz, RNAseq, small RNAseq]
published: true
date: 2017-03-20T17:50:01-04:00
---

Differentially gene expression analysis with [RNA-seq](https://en.wikipedia.org/wiki/RNA-Seq) data is quite common nowadays, and there are pretty good [Bioconductor](http://bioconductor.org) packages for that: [limma::voom](http://bioconductor.org/packages/release/bioc/html/limma.html), [DESeq2](http://bioconductor.org/packages/release/bioc/html/DESeq2.html) ...

The code for that part is quite simple, being super quick to get a list of de-regulated genes. However, downstream analyses vary a lot depending on the project itself. But I found myself doing the same plots and analyses many times for different project, so I put together a bunch of plots and analyses using code from my colleagues at work ([@HSPH bioinformatics core](http://bioinformatics.sph.harvard.edu)) and myself.

There are many possibilities, including QC figures, but the features that seem more interesting are:

* plot of individual genes using multiple variables from the metadata. This would be an evolution of plotCounts function from DESeq2. Fig1
* plot volcano plots labeling some genes. Fig2
* clustering set of genes to find common patterns expression. Most useful for time seria data. You get as well the list of genes that follows that pattern, so you can use it for functional analysis, for instance. Fig3

note: maybe some features only available with development version

![fig1](https://github.com/lpantano/mypubs/raw/master/DEG_viz/figure/plots-1.png)
![fig2](https://github.com/lpantano/mypubs/raw/master/DEG_viz/figure/plots-3.png)
![fig3](https://github.com/lpantano/mypubs/raw/master/DEG_viz/figure/plots-2.png)

Package available at [BioC page](http://bioconductor.org/packages/devel/bioc/html/DEGreport.html)

The code is available [here](https://github.com/lpantano/mypubs/blob/master/DEG_viz)

Hope you enjoy!

Any suggestion and/or issue is welcome [here](https://support.bioconductor.org/p/new/post/?tag_val=DEGreport)

>"sincerity in bioinformatics: try hard to explain the limitation of your analysis to non-computational researchers"
