---
title: miRNA Annotation Tools Comparison
tags: [miRNA]
published: true
author: lorena_pantano
date: 2016-03-24T19:49:01-04:00
---

In summary: I will show which is the best miRNA mapping tool. I used several options for this benchmarking:

*   miraligner from [SeqBuster](http://github.com/lpantano/seqbuster) suit (I am one of the authors)
*   [bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml) and [bowtie](http://bowtie-bio.sourceforge.net/index.shtml)
*   [novoalign](http://www.novocraft.com/main/index.php) from novocraft suit
*   [GEM](http://algorithms.cnag.cat/wiki/The_GEM_library)
*   [srnabench](http://arn.ugr.es/srnabench/)
*   [microrazer](http://www.seqan.de/projects/MicroRazerS.html.)
*   [STAR](https://github.com/alexdobin/STAR)
*   [miRExpress](http://mirexpress.mbc.nctu.edu.tw/)

I think that these are the most used, and other not used but good to try them. They were clearly developed for other purposes, but as well, they generate the input of many miRNA pipelines. I just wanted to know how well my tool was doing. The first aim to develop miraligner was to get annotated additions of nucleotides at the end of miRNA sequences, something that is very common in mirna biogenesis: [isomirs](http://en.wikipedia.org/wiki/IsomiR) and often they are missed by short read and fast mappers. I have a [repository](https://github.com/lpantano/mypubs/tree/master/mirna/mirannotation) for this kind of things, so anybody can reproduce my results, and check if I did something wrong, or comment on it. In this post I just want to know which tool detects more miRNA, for that I did two main steps:

1.  simulate a bunch of miRNAs (isomirs) with my python [script](https://github.com/lpantano/seqbuster/blob/master/misc/miRNA.simulator.py) that is part of SeqBuster suit. I generated around 10000 sequences. Normally, one small-RNAseq library produces around half million different sequences.
2.  use only miRBase human precursors as reference genome

I used default parameter for all, so probably there is a set of parameters that would be better for some tools, but I didn't search for them this time (happy to accept issues to add them). The [results](http://rawgit.com/lpantano/mypubs/master/mirna/mirannotation/stats.html) are:

1.  **miraligner** and **STAR** map **more sequences**. miraligner loses sequences shorter than 15 nt, normally (miRNA) are around 21, and those sequences map to repeat elements
2.  STAR is the best mapping, but need some parsing to reduce false positive. I think that pipelines should change to this tool.
3.  **GEM** has problems with **additions and nt substitutions** in many cases, same as novoaligner (I will look at this in the future)
4.  **bowtie2/bowtie is the second** that annotated most (and best)
5.  **microrazer** has a problem with **mismatches**, but maybe there is some parameter to trick
6.  **miRExpress** with default options only will map perfect matches sequences to precursor, so strongly recommended to allow errors to increase sensibility.

I have to say that the advantage of [miraligner](https://github.com/lpantano/seqbuster/wiki/miraligner) is that it gives you the sequence annotated as miRNA or precursor, and gives you the exactly modifications that sequences have if they are compared to miRBase database. And you could feed the results to my [R package](https://github.com/lpantano/seqbuster/wiki/isomiRs) to plot isomers distribution of samples from different groups, and do differential expression analysis with DESeq2, or another tool. I didn't add time consumption because all of them run in a couple of minutes. In my next post I will focus in the the correct annotation of each sequence, and the possible problems with cross-mapping events, when the sequence comes from another regions of the genome but map to miRBase precursor as well [see my previous [post](http://lorenapantano.wordpress.com/2013/05/27/mirna-annotation-complex-scenarios/) for more details]. As well I will use STAR with the full genome and see if the mapping continues being the best. In that case I will add a script to SeqBuster to parse the output of STAR for those who can map with STAR (need up to 32G for human genome)
