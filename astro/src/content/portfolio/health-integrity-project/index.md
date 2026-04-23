---
title: The Health Integrity Project
summary: Community platform for expert-reviewed health claim verification — connecting users with evidence-backed analysis of health products and scientific literature
tags:
  - React
  - Supabase
  - Health
  - Community
  - Netlify
categories:
  - Web App
audience:
  - General Public
date: "2026-04-21"
featured: true
url_demo: "https://healthintegrityproject.org"
links:
  - name: Live App
    url: https://healthintegrityproject.org
---

A full-stack web platform built to bring transparency to health claims. Users can search, submit, and evaluate health claims — each one reviewed against peer-reviewed scientific literature by a network of medical experts.

[**Open App →**](https://healthintegrityproject.org)

## What It Does

The Health Integrity Project lets anyone search health claims and see whether the scientific evidence supports, disproves, or remains inconclusive on a given topic. Claims are linked directly to published research papers, and a community of vetted experts can add commentary, score publications, and flag misleading content.

## Key Features

- **Claim verification**: Status tracking from submission through expert review (Supports / Disproves / Inconclusive / Awaiting Evidence)
- **Expert network**: Role-based access for medical professionals to review and annotate claims
- **Publication management**: DOI-based paper lookup with multi-criteria expert scoring
- **Community tools**: Voting, subscriptions, feature requests, and statistical literacy games
- **Authentication**: Google OAuth and email/password with role-based access control (Admin, Expert, Researcher, Ambassador, User)

## Stack

Built with React, TypeScript, Tailwind CSS, and shadcn-ui on the frontend, backed by Supabase for authentication, database, and real-time features, deployed on Netlify.
