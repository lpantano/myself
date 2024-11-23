---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Showcase: Nextflow pipeline in 30min with Seqera AI"
subtitle: ""
summary: "Example of automation with miniaml investment but good results"
authors: []
tags: []
categories: []
date: 2024-11-21T12:00:00-04:00
lastmod: 2024-11-21T12:00:00-04:00
featured: true
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

Today, I encountered a familiar dilemma that seems to pop up whenever a simple task comes my way: should I stick to the tried-and-true methods, or should I embrace automation? This time, it was about subsampling raw sequencing data. In my group, we've been doing this for ages: copy-pasting an SBATCH script, loading the necessary modules, tweaking the code, submitting it to the cluster, and then closely monitoring it. It usually gets the job done.

But, we're living in exciting times! With tools like [Nextflow](https://www.nextflow.io), [Seqera](https://seqera.io), and [Seqera AI](https://seqera.io/ask-ai/), I decided to take a leap and harness the power of Seqera AI to create a small Nextflow pipeline for processing fastq files and generating subsampled outputs. Within just 30 minutes, I managed to build a [pipeline](https://github.com/bcbio/nextflow-subsample/tree/main) using the seqtk nfcore/module, complete with test data, and config files that enabled Docker compatibility and execution within our Seqera Workspace. Okay, full disclosure, someone else on the team actually ran the pipeline, what makes this even a better example of accesibility. 

Of course, AI didn't do all the work for me; it simply kick-started the process. As someone who knows a thing or two about development, I was able to troubleshoot and refine what the AI initially provided. The pipeline did run, but we hit a snag with jobs failing due to memory constraints. It turned out our output files were pretty hefty, so I delved into the tool's parameters and quickly adjusted the necessary config settings. Problem solved!

This experience is a testament to how we can speed up analyses without sacrificing reproducibility or accessibility. And thanks to Seqera, pinpointing the memory issue was a breeze. I genuinely believe adopting such tools will lower the barriers to creating small or infrequent projects and ultimately improve our research. So, why not give your own small pipeline a shot?

And yes, this post got a little help from Harvard Open AI GPT-4 to bring it to you.
