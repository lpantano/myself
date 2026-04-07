---
title: PANGEA-SMM Clinical Calculator
summary: Production web app for a Nature Medicine paper — a dynamic risk calculator for smoldering multiple myeloma built with React + R Plumber, deployed on Netlify and GCP
tags:
  - React
  - R
  - Clinical Tools
  - GCP
  - Netlify
  - Infrastructure
categories:
  - Web App
date: "2026-03-25"
featured: true
url_demo: "https://pangeamodels.org"
links:
  - name: Live App
    url: https://pangeamodels.org
  - name: Nature Medicine Paper
    url: https://doi.org/10.1038/s41591-026-04304-x
---

A production clinical web app built for the [Ghobrial Lab at Dana-Farber Cancer Institute](https://ghobriallab.dana-farber.org/), published alongside a [Nature Medicine paper](https://doi.org/10.1038/s41591-026-04304-x) introducing PANGEA-SMM — a dynamic risk calculator for smoldering multiple myeloma.

[**Open Calculator →**](https://pangeamodels.org)

## What It Does

PANGEA-SMM predicts progression risk from smoldering multiple myeloma to active disease using longitudinal biomarkers — without requiring a bone marrow biopsy. Clinicians enter patient data and receive 5-year progression curves with confidence intervals.

## Architecture

- **Frontend**: React 19 + TypeScript + Tailwind CSS, deployed on Netlify via CDN
- **Backend**: R Plumber REST API running in Docker on a GCP e2-medium VM
- **Infrastructure**: Nginx for SSL termination, rate limiting, and CORS; Let's Encrypt for certificates
- **Privacy**: Stateless API — patient data is never stored

## Why Not Shiny?

The original prototype was R Shiny. It worked for demos but had reliability and scalability limits for 24/7 clinical use. Moving to React + R Plumber decouples the UI from computation while keeping the validated R statistical models intact.
