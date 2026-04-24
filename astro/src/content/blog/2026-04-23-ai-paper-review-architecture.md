---
title: "How I Built an AI-Powered Scientific Paper Review System"
subtitle: "Architecture of an AI-guided peer review system for evaluating health claims at scale"
summary: "Architecture walkthrough of an AI-guided peer review system using Claude, GitHub, Supabase, and Next.js to evaluate health claim evidence at scale."
authors: []
tags: ["AI", "architecture", "peer-review", "Claude", "Next.js", "Supabase", "scientific-computing"]
categories: ["Data at Scale"]
date: 2026-04-23T12:00:00-04:00
featured: false
draft: false
---

## Overview

Architecture behind a system I built to help expert reviewers evaluate scientific papers against health claims. The core idea: instead of giving reviewers a blank form, Claude guides them through a structured classification workflow — asking questions, checking their reasoning, generating a structured review. GitHub handles storage and audit trails. Supabase handles auth and the database. Next.js ties it together.

---

## The Problem

Evidence-based health claims need peer review at scale. Reviewers — researchers and domain experts — evaluate dozens of papers against specific claims (e.g., "Does omega-3 supplementation reduce cardiovascular risk?"), making multiple decisions: Is the study design valid? What's the sample size? Does the paper actually support or contradict the claim?

A blank form doesn't help. A chatbot that answers questions doesn't help either. What works is a structured interview — someone who knows the classification framework, asks the right follow-up questions, and produces standardized output at the end. That's Claude's job.

### The Reviewer's Mental Model

From the reviewer's perspective: open a paper, talk to an AI that's read it and knows the framework, answer its questions, review the draft it generates, tweak a few fields, submit. The architecture is invisible.

### The Community Layer

One non-obvious problem this solves: redundancy. If a researcher friend asks "has omega-3 been validated for cardiovascular risk?", you'd normally dig through papers yourself. With a shared reviewer database, you don't.

Reviewers sign up or get invited. Once in, they can browse claims, read existing reviews, add their own (multiple independent reviews strengthen confidence), and see aggregate evidence status across all reviewed papers.

One expert reviewing a paper is useful. Three independent experts reaching the same conclusion is evidence. The scoring algorithm weights papers with multiple reviewer agreements accordingly. When reviewers disagree, the system surfaces that conflict — it doesn't average it away.

---

## The Stack

- **Next.js 15** (App Router) — full-stack framework, server and client components
- **Supabase** — PostgreSQL database, Auth, Row Level Security
- **Anthropic SDK** — Claude `claude-sonnet-4-6`, Files API
- **GitHub** (via Octokit) — paper PDF storage, review archival, issue tracking
- **pdf-parse** — text extraction and DOI validation from uploaded PDFs
- **Crossref API** — DOI lookup and paper metadata validation

---

## Reviewer Workflow

### 1. Choose a Claim and Paper

The reviewer lands on `/review/new`, selects a health claim from a dropdown, then sees all papers associated with that claim. If they've already started reviewing a paper, the UI links to their existing session.

### 2. Upload the PDF

Before the session starts, the reviewer uploads the paper PDF. The system validates file type and size (max 10 MB), extracts text via `pdf-parse`, attempts DOI extraction, cross-validates against the Crossref API, prompts for manual confirmation on mismatch, then uploads the validated PDF to a private GitHub repo at `papers/YEAR-SLUG.pdf`.

GitHub as paper storage: private repos, versioned, API-accessible, free for reasonable sizes.

### 3. Start the Review Session

On confirmation, the system creates a `review_sessions` row in Supabase. A unique constraint on `(reviewer_user_id, publication_id)` prevents duplicates — if the reviewer tries to start the same review twice, they get redirected to their existing session.

### 4. The AI-Guided Interview

The core of the system. Reviewer enters an interactive chat at `/review/[session_id]` — chat left, PDF viewer right.

On first load, the server checks whether the paper's Anthropic Files API ID is cached. If not (or expired), it fetches from GitHub and re-uploads, caching the returned `file_id`. The chat route builds full conversation history from `review_chat_messages` and sends it to Claude with:
- The system prompt (full classification workflow)
- The paper: `{ type: 'document', source: { type: 'file', file_id: anthropicFileId } }`
- Publication metadata and the specific health claim

The system prompt is a 200+ line document defining the "Evidence Decoded" framework. Not a script — Claude reads the paper, understands the claim, and guides the reviewer through five steps:

1. **Validation** — Does the paper study the claimed intervention? Is it peer-reviewed?
2. **Quality Assessment** — Study design, control group, statistical methods, bias risk
3. **Study System** — Human, animal, or in vitro?
4. **Study Type** — Clinical trial, observational, case study, review?
5. **Sample Size** — Participant count, age and ethnicity breakdown

Claude asks targeted follow-ups based on the paper and reviewer responses. If the reviewer says "it's a randomized trial," Claude follows with RCT-specific questions.

Responses stream to the client. Every message persists to `review_chat_messages` — close the tab, come back, full chat is there.

### 5. Structured Output Extraction

When Claude has enough information to generate the review, it produces a structured markdown response with an embedded JSON block in an HTML comment:

```
<!-- REVIEW_JSON_START -->
{ "category": "Limited", "study_type": "Observational", ... }
<!-- REVIEW_JSON_END -->
```

The frontend watches for these markers in the streamed response and automatically parses the JSON to pre-populate an editable review form. The reviewer can edit every field before submitting.

### 6. Submitting the Review

On submit (non-fatal errors don't block completion):

1. **Archives the chat transcript** to GitHub as `reviews/PAPER-SLUG-review-N.md` — permanent, auditable
2. **Creates GitHub issues** for skill improvement suggestions Claude embedded via `<!-- SKILL_IMPROVEMENT_START -->` markers
3. **Upserts a `publication_scores` row** with review data, expert comment, and `ai_assisted: true`
4. **Recalculates `evidence_status`** across all publication scores using a weighted scoring algorithm
5. **Marks the session completed**

**Evidence status calculation:**

Each paper gets a base score by category:
- Widely Tested → 10
- Tested → 8
- Limited → 6
- Not Studied → 1
- Invalid / Inconclusive → 0
- Misinformation → -1

Multiplied by a study type multiplier (Clinical Trial = 1.0, Observational = 0.7, Other = 0.1), then tallied separately for supporting vs. contradicting papers. The comparison determines the claim's overall evidence status: "Evidence Supports", "Evidence Disproves", or "Inconclusive".

---

## Why GitHub for Storage?

- **Versioned PDF storage** — immutable once uploaded, human-readable paths
- **Review archival** — every chat transcript committed as markdown, browsable in the repo
- **Issue tracking** — Claude flags classification workflow patterns worth improving; the system files GitHub issues automatically, closing the feedback loop

The alternative (S3 + issue tracker + archival system) is three services. GitHub is one.

---

## The Anthropic Files API

Instead of sending the PDF inline with every message, I use Anthropic's Files API: upload once, get a `file_id`, reference it on every subsequent call. Sending an 8 MB paper with every turn in a long session would be slow and wasteful.

Caching strategy:
1. Check publications table for a stored `anthropic_file_id`
2. Try to use it — 404 means expired
3. On expiry, re-fetch from GitHub, re-upload, update cached ID

First message after expiry is slightly slower. Everything after is fast.

---

## What I'd Do Differently

**Feedback loop is still manual.** Claude flags improvements and the system files issues, but someone has to read them and update the prompt. A scheduled job that aggregates, clusters, and drafts prompt changes for human review would close the loop properly.

**GitHub PDF storage doesn't scale.** S3 with proper access controls is more robust. GitHub's API has rate limits and isn't designed for large binary storage.
