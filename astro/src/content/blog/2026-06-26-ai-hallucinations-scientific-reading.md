---
title: "Hallucinations in Literature Review Can Be Invisible"
subtitle: "How we cut near-total hallucination in a paper-review agent down to almost none"
summary: "An LLM reading scientific PDFs invented ~95% of the numbers we spot-checked. Here's the grounding setup (Files API, prompt cache, citations, and strict skill rules) that keeps it honest."
authors: []
tags: ["AI", "Claude", "hallucination", "peer-review", "scientific-computing", "grounding"]
categories: ["Data at Scale"]
date: 2026-06-26T12:00:00-04:00
featured: false
draft: false
---

When we first pointed an LLM at scientific papers for the [Health Integrity Project](https://healthintegrityproject.org), it looked great and roughly 95% of the numbers I spot-checked were wrong. Wrong p-values, wrong table references, section after section. All of it plausible enough that we almost didn't check.

The fix wasn't a better prompt alone. It took two layers working together: **infrastructure** that keeps the real PDF grounded every turn, and **prompt rules** that forbid guessing. Either one alone fails.

In practice that means uploading the PDF once with the Files API and reusing it across turns, so the model can't claim it lost access and fall back on memory. It means prompt cache on from the first message, so keeping the paper present every turn is cheap and there's no cost excuse to drop it. It means citations enabled, so every quote is page-anchored; if it can't point to a page, it can't cite. And it means strict skill rules re-sent every message: if you can't find the exact string in the PDF, write "not reported." A correct "I don't know" beats a confident wrong answer.

The scientific numbers are right now, when I check them. What still slips through is the occasional wrong reference, pointing to the wrong table, not a fabricated statistic. It stays under $1 per review.

I wrote up the full setup with the config, what didn't work, and the exact anti-hallucination wording on the Health Integrity Project blog:

**[Read the full post →](https://open.healthintegrityproject.org/blog/ai-hallucinations-scientific-reading)**

If you're building your own review agent, the failure modes are the same whether you read one paper or many. Keep being a scientist: check what the AI tells you against the source, every time it gives you a number or a citation.
