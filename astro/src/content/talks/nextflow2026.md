---
title: "A Lab-Scale Pipeline Factory: Using AI Agents and Skills to Accelerate Nextflow Development"
date: 2026-05-13T00:00:00-05:00
draft: false

time_start: 2026-05-13T00:00:00-05:00

authors: ["Lorena Pantano"]

abstract: |
  The Ghobrial Lab generates hundreds of single-cell RNA-seq, spatial transcriptomics, and whole-genome sequencing datasets across large patient cohorts — and the scientific questions change faster than traditional pipeline development can keep up.

  We describe a system that uses Claude AI agents and custom "skills" (reusable, codified prompts) to function as an on-demand Nextflow pipeline factory. Two core skills — /setup-pipeline and /add-process — generate production-ready Nextflow DSL2 skeletons in under one hour: complete with GCP Batch profiles, spot instance retry logic, Docker container strategies, stub testing, and per-process resource configuration. A structured knowledge base (.memory/) encodes lab-specific conventions — GCP project settings, container selection priorities, samplesheet patterns, error strategies — so every new pipeline inherits the same battle-tested defaults without re-reading documentation.

  The result is a growing repository of small, focused pipelines — HLA typing, BCL conversion, CD45 isoform quantification, 10x Cell Ranger, spatial transcriptomics — each deployable to Google Cloud Batch, each testable locally in minutes. When a new tool or method needs to be evaluated across hundreds of samples, the bottleneck shifts from "write the pipeline" to "run the science."

  We discuss how the AI agent serves as a co-developer: it reads existing pipelines, infers conventions, and makes consistent decisions across modules. We share lessons learned on what to encode in memory vs. what to leave flexible, and how this approach could generalize to other labs facing the same velocity challenge.
abstract_short: "AI agents and reusable skills act as an on-demand Nextflow pipeline factory — generating production-ready DSL2 pipelines in under an hour, encoding lab conventions in a structured knowledge base, and shifting the bottleneck from pipeline writing to running the science."

event: "Nextflow Summit 2026"
event_url: "https://summit.nextflow.io/2026"

projects: []

slides: ""

tags: []

url_pdf: ""
url_slides: ""
url_video: "https://www.youtube.com/watch?v=JmTUHyt4Xkc"
---
