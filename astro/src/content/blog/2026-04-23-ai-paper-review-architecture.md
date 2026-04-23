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

This is the architecture behind a system I built to help expert reviewers evaluate scientific papers against health and wellness claims. The core idea: instead of giving reviewers a blank form, Claude (Anthropic's AI) guides them through a structured classification workflow — asking questions, checking their reasoning, and ultimately generating a structured review. GitHub handles storage and audit trails. Supabase handles auth and the database. Next.js ties it together.

Here's how all the pieces fit, from the reviewer's first click to a submitted review.

Most importantly, your review gets shared so you can share it with your friends and family about that health question they keep asking you.

---

## The Problem

Evidence-based health claims need peer review at scale. Reviewers — researchers and domain experts — need to evaluate dozens of papers against specific claims (e.g., "Does omega-3 supplementation reduce cardiovascular risk?"). The review process involves multiple decisions: Is the study design valid? What's the sample size? Is this a clinical trial or observational study? Does the paper actually support or contradict the claim?

A blank form doesn't help. A chatbot that just answers questions doesn't help either. What helps is a structured interview — someone who knows the classification framework guiding the reviewer step by step, asking the right follow-up questions, and producing a standardized output at the end.

That's Claude's job here.

### The Reviewer's Mental Model

From the reviewer's perspective, the experience is: open a paper, talk to an AI that's clearly read the paper and knows the classification framework, answer its questions, review the draft it generates, tweak a few fields, hit submit.

The complexity of the architecture is entirely invisible. The reviewer just has a conversation.

That's the goal.

### The Community Layer: Reviews You Don't Have to Redo

One problem this system solves that isn't obvious from the architecture: the redundancy problem.

If you're a researcher and a friend asks "has omega-3 been validated for cardiovascular risk?", you'd normally dig through papers yourself — or trust their summary. With a community of reviewers contributing to the same database, you skip that.

### Joining the Community

Reviewers sign up or get an invitation from an existing member. Once admitted, they can:

- Browse claims and see which papers have existing reviews and read them
- Add their own review to any paper — even one that already has a review (multiple independent reviews strengthen confidence)
- See the aggregate evidence status for any health claim across all reviewed papers

### Why Multiple Reviews Matter

One expert reviewing a paper is useful. Three independent experts reviewing the same paper — and reaching the same conclusion — is evidence. The scoring algorithm accounts for this: papers with multiple reviewer agreements carry more weight in the evidence status calculation.

When reviewers disagree, the system surfaces that conflict explicitly. It doesn't average away disagreement; it flags it as a signal that the paper needs closer attention.

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

Before the review session starts, the reviewer uploads the paper PDF. The system:

1. Validates file type and size (max 10 MB)
2. Extracts text using `pdf-parse` and attempts DOI extraction
3. Cross-validates the extracted DOI against the paper's metadata in the database using the Crossref API
4. If the DOI doesn't match, the reviewer is prompted to confirm manually
5. Uploads the validated PDF to a private GitHub repository at `papers/YEAR-SLUG.pdf`

GitHub as paper storage is a practical choice: private repos, versioned, accessible via API, free for reasonable sizes.

### 3. Start the Review Session

On confirmation, the system creates a `review_sessions` row in Supabase. A unique constraint on `(reviewer_user_id, publication_id)` prevents duplicates — if the reviewer tries to start the same review twice, they get redirected to their existing session.

### 4. The AI-Guided Interview

This is the core of the system. The reviewer enters an interactive chat interface at `/review/[session_id]`. The layout is a side-by-side split: chat on the left, PDF viewer toggle on the right.

**What happens under the hood:**

1. The first time a session loads, the server checks if the paper's Anthropic Files API ID is cached in the database
2. If not (or if the cached file has expired), it fetches the PDF from GitHub and uploads it to Anthropic's Files API, caching the returned `file_id` in the publications table
3. The chat API route (`/api/review/sessions/[session_id]/chat`) builds a full conversation history from `review_chat_messages` and sends it to Claude along with:
   - The system prompt (the full classification workflow)
   - The paper as a document source: `{ type: 'document', source: { type: 'file', file_id: anthropicFileId } }`
   - The publication metadata and the specific health claim being evaluated

**Claude's role:**

The system prompt is a 200+ line document (`.claude/commands/review-paper.md`) that defines the "Evidence Decoded" classification framework. It's not a script — Claude reads the paper, understands the claim, and guides the reviewer through five decision steps:

1. **Validation** — Does the paper actually study the claimed intervention? Is it peer-reviewed?
2. **Quality Assessment** — Study design, control group, statistical methods, bias risk
3. **Study System** — Human, animal, or in vitro?
4. **Study Type** — Clinical trial, observational, case study, review?
5. **Sample Size** — How many participants? Age, ethnicity breakdown?

At each step, Claude asks targeted follow-up questions based on what it reads in the paper and what the reviewer says. It's interactive, not scripted. If a reviewer says "it's a randomized trial," Claude follows up with questions specific to RCTs.

**Streaming and persistence:**

Responses are streamed to the client. Every message (user and assistant) is persisted to `review_chat_messages` with role, content, and timestamp. If the reviewer closes the tab and comes back, the full chat is restored.

### 5. Structured Output Extraction

When Claude has enough information to generate the review, it produces a structured markdown response with an embedded JSON block in an HTML comment:

```
<!-- REVIEW_JSON_START -->
{ "category": "Limited", "study_type": "Observational", ... }
<!-- REVIEW_JSON_END -->
```

The frontend watches for these markers in the streamed response and automatically parses the JSON to pre-populate an editable review form. The reviewer can edit every field before submitting.

### 6. Submitting the Review

On submit, the system does several things (non-fatal errors don't block completion):

1. **Archives the full chat transcript** to GitHub as `reviews/PAPER-SLUG-review-N.md` — a permanent, auditable record
2. **Creates GitHub issues** for any skill improvement suggestions Claude embedded in the chat (using `<!-- SKILL_IMPROVEMENT_START -->` markers)
3. **Upserts a `publication_scores` row** with the structured review data, expert comment, and `ai_assisted: true` flag
4. **Recalculates the claim's `evidence_status`** across all publication scores using a weighted scoring algorithm
5. **Marks the session as "completed"**

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

GitHub does several things well here that are hard to replicate cheaply:

- **PDF storage with versioning** — papers are immutable once uploaded, but the path is human-readable
- **Review archival** — every chat transcript committed as a markdown file, browsable in the repo
- **Issue tracking for improvement** — when Claude detects patterns worth improving in the classification workflow, it flags them, and the system automatically files GitHub issues. This closes the feedback loop between reviewer sessions and system improvement.

The alternative (S3 + a separate issue tracker + some archival system) would be three services. GitHub is one.

---

## The Anthropic Files API

One design decision worth explaining: using Anthropic's Files API instead of sending PDFs inline with every request.

PDFs can be large. Sending the same 8 MB paper with every message in a long review session would be slow and wasteful. The Files API lets you upload a file once, get back a `file_id`, and reference it in subsequent API calls. The file stays on Anthropic's servers for a limited time.

The caching strategy:
1. Check the publications table for a stored `anthropic_file_id`
2. If found, try to use it — if Anthropic returns a 404, the file has expired
3. On expiry (or missing), re-fetch from GitHub and re-upload to Anthropic, updating the cached ID

This means the first message in a new session after the file expires is slightly slower. Everything after is fast.

---

## What I'd Do Differently

**Skill improvement feedback loop is manual.** Claude flags potential improvements and the system files GitHub issues, but someone still has to read those issues and update the system prompt. A better version would have a scheduled job that aggregates flagged improvements, clusters similar suggestions, and drafts prompt changes for human review.

**PDF storage in GitHub is convenient but not ideal.** At scale, S3 with proper access controls is more robust. GitHub's API has rate limits and isn't designed for large binary storage.
