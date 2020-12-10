+++
title = "miRTOP: An open source community project for the development of a unified format file for miRNA data"
date = 2018-06-27T13:13:02-09:00  # Schedule page publish date.
draft = false

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
time_start = 2018-06-27T13:41:00-09:00
time_end = 2018-06-27T14:00:00-09:00

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Thomas Desvignes", "Karen EIlbeck", "Ioannis S. Vlachos", "Bastian Fromm", "Yin Lu", "Marc K. Halushka", "Michael Hackenberg", "Gianvito Urgese", "Elisa Ficarra", "Shruthi Bandyadka", "Jason Sydes", "Peter Batzel", "John H. Postlethwait", "Phillipe Loher", "Eric Londin", "Aristeidis G. Telonis", "Isidore Rigoutsos", "Lorena Pantano"]

# Abstract and optional shortened version.
abstract = "MicroRNAs (miRNAs) are small RNA molecules (20-27 nt long) that are involved in eukaryotic  gene regulation. They regulate targeted genes by RNA complementarity, generally between the miRNA seed region and the 3’ UTR of messenger RNAs. They have become relevant to the study of developmental stages and diseases. With the advance of sequencing technology, the cost of detecting the miRNA transcriptome has decreased substantially, and has led to the discovery of isomiRs (with slight sequence variations relative to the annotated miRNAs). As a consequence, the amount of miRNA data has increased exponentially in the last 5 years, together with the number of pipelines to analyze it. However, there is still a lack of consensus standards in storing and sharing such data, generating diverse output files; hindering comparison between tools, data sharing, and development of downstream analyses independent of the tools used for miRNA detection and quantification. Here, we present a community based, open source project to work toward the standardization of miRNA pipelines and encourage the development of downstream tools for visualization, differential expression, sample clustering, and model prediction analyses. This project is an international collaboration, with experts from different countries that have been developing miRNA pipelines and resources. We have described a standard format for the output of miRNA detection and quantification tools using small RNA-seq data. The format is based on the GFF3 standard in order to support reference coordinates and parent/child relationships between the features. The format contains information foreach sequence and its annotation to the miRNA precursor, the definition of reference or isomiR sequence, its quality, the isomiR type, and abundance in the data set. Moreover, we support a command line python tool to manage the miRNA GFF3 format (miRTop). Currently, miRTop can convert the output of commonly used small RNA-Seq pipelines, such as seqbuster, isomiR-SEA, sRNAbench, and Prost!, as well as BAM files to the miRNA GFF3 format. Importantly, the miRge pipeline has adapted the GFF3 format natively. miRTop can convert miRNA GFF3 files to a count matrix that can be easily imported to any downstream tool (i.e. for differential expression analysis). Furthermore, the tool can export the miRNA GFF file to the isomiRs package, improving the usability of this tool and rendering it independent of the upstream methods used for quantifying miRNA sequences. Together, we believe that the miRTop project will improve accessibility and uniformity of the results oft miRNA pipelines, the possibility to easily run benchmarking analyses, and promote the development of miRNA tools downstream of the detection and quantification steps."

abstract_short = "MicroRNAs (miRNAs) are small RNA molecules (~22 nucleotide long) involved in post-transcriptional gene regulation. Advances in high-throughput sequencing technologies led to the discovery of isomiRs, which are miRNA sequence variants. While many miRNA-seq analysis tools exist, a lack of consensus on miRNA/isomiR analyses exists, and the resulting diversity of output formats hinders accurate comparisons between tools and precludes data sharing and the development of common downstream analysis methods.To overcome this situation, we present here a community-based project, miRTOP (miRNA Transcriptomic Open Project) working towards the optimization of miRNA analyses. The aim of miRTOP is to promote the development of downstream analysis tools that are compatible with any existing detection and quantification tool. See more at: https://github.com/miRTop/mirGFF3, https://github.com/miRTop/mirtop, http://mirtop.github.io/."

# Name of event and optional event URL.
event = "Bioinformatics Open Source Conference 2018"
event_url = "https://gccbosc2018.sched.com/"

# Location of event.
location = "Portland, OR"

# Is this a selected talk? (true/false)
selected = true

# Projects (optional).
#   Associate this talk with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["deep-learning"]` references
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects = []

# Slides (optional).
#   Associate this page with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references
#   `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides = ""

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["miRNA", "isomiR"]

# Links (optional).
url_pdf = "https://f1000research.com/slides/7-953#"
url_slides = "https://f1000research.com/slides/7-953"
url_video = ""
url_code = ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = ""
+++
