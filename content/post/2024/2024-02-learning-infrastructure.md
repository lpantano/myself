---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "My Learning Experience with Computational Infrastructure in Biotech/Industry"
subtitle: ""
summary: "The mistakes and the success of building as fastest as possible the infrastructure"
authors: []
tags: []
categories: []
date: 2024-02-28T12:00:00-04:00
lastmod: 2024-02-28T12:00:00-04:00
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

And here we go again, after 5 years working in early-stage companies, I decided to share what I learned about building an infrastructure that works for the needs of a small company. Note, that there won't be a unique solution to this, and depending on the data input throughput the strategy will change. A good introduction to DataOmics and why this is important can be found at [Hammerspace](https://www.youtube.com/@hammerspace_globaldata) in an interview with [Eleanor Howe](https://youtu.be/GpTY019G2DM?si=YDahYJ9H_Lrfy2qH).

Before I start, many other great experts have already talked about this, I learned from them and applied much of what they have said: [Michele Busby](https://www.tumblr.com/michelebusby/643211974587629568/so-you-want-to-start-a-biotech-a-bioinformatics?source=share), and recently from [Jack Lindamood](https://cep.dev/posts/every-infrastructure-decision-i-endorse-or-regret-after-4-years-running-infrastructure-at-a-startup/?utm_source=tldrnewsletter). 

Now some context, because context matters. I built everything from scratch at NextRNA. This company focused on targeting lncRNA-protein interactions with small molecules to expand the therapy landscape in oncology and neurodegeneration. The data we use is mainly RNAseq, since we are focusing on detecting lncRNA drivers. We have to internalize raw data from big studies like [TCGA](https://www.cancer.gov/ccg/research/genome-sequencing/tcga) and similar, to re-analyze it with our pipeline and annotation. 

[AWS cloud services](https://aws.amazon.com) are what is working for us, and it helps us to be stable.

* **Network**: we have two VPCs, with two subnets (private and public). We only use the private subnet and we connect to them through the VPN Client services and with the VPN tunnels to our office. All machines have specific group security configurations to allow only the machine-to-machine communication we know will happen. This can be painful, but it will keep you aware of what is accessible. One VPC is dedicated to shared servers ( I will talk later about this), and another, to machines that will be created through the Batch service, you can call it our HPC space.
* **Storage**: we use mainly S3, we have different buckets depending on data usage policies. We store controlled data that needs to follow specific data usage agreements with NIH. We have permanent processed data and raw data with different storage classes to make it more cost-effective. We have an EFS that is mounted on our shared servers, so every temporary data that we need meanwhile we run downstream data analyses can be accessed from different applications. Some of this data is not temporary but is small and need fast access by Web-Apps, so we keep it here instead of S3.
* **Shared Servers**: we decided to go with the now-name Posit Bundle: workbench, connect and package manager. This together with our shared file system has made my team collaboration very efficient. About the software, we use all the same R version, with the same R packages. This ensures reproducibility. We decide as a team, the time to update to the next R version and what are the migration steps needed for this. This allows us to publish visualization tools very easily as well, and it has fostered the relationship with the other groups in the company. Nothing gives me more joy than seeing my team talking every day with colleagues from other groups.
* **Pipelines**: The biggest contribution to our better efficiency has been using Seqera platform together with NextFlow pipelines. I will always go with this, it makes it so easy to know what is going on, help debug, relaunch pipelines... And there are features we are not using yet that will make many other processes easier, like datasets ready to be analyzed at any point, visualizing reports, spin-off on-demand machines...
* **GitHub**: this is not new, but I want to share how we use it. We decided on some naming conventions for repositories, have templates repositories, and have documentation in the repository. Have a company internal package that collects all the common code that is used now and then, so we make sure that repetitive analyses of data are the same, and anybody can work on them. As well we have our figure theme so we are consistent when we create reports. We use it a lot for BD material creation.

Finally, even if it is not part of the computing infrastructure, I would say managing projects efficiently is important. We tried different things, but what worked the best was [Trello](https://trello.com/). We decided on a protocol on what a card would mean, how to annotate the card, how to see the workload of the team only by looking at the Trello board...and it worked like magic. We have a weekly meeting to align on the short-term goals and long-term goals and plan accordingly. 

Other solutions I know they will be good but I couldn't explore more because of time constraints and budget limitations. For instance, [Code Ocean](https://codeocean.com/). I know about [Deep Origin](https://www.deeporigin.com/), it would be more like an advanced software as a service but it could be part of the overall infrastructure to accelerate the time between data and decision. Similar companies, like [BigOmics](https://bigomics.ch) helps to analyze data quickly without thinking on the backend. [BioBox](https://biobox.io/) is working in new products as well, this one focused on graph data representation.

More focused on data, I would evaluate [TileDB](https://tiledb.com/) and [Databricks](https://www.databricks.com) when the time is right and the amount of data and integration are a limitation to your process. If you need more help with this, I recently met [Jesse Johnson](https://scalingbiotech.substack.com/), he is an expert in the data space working with Biotechs.

This is a summary, but I hope it is enough to give a broad idea. Happy to talk with anybody who wants to know more. This strategy was highly influenced by [Judit Flo](https://www.linkedin.com/in/judith-flo-gaya-8999394/). 
