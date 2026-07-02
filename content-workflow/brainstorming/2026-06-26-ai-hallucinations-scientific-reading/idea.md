# Idea: AI Hallucinations When Reading Scientific Information

**Audience**: Scientists ("Data at Scale")

## Concept

AI tools (LLMs) increasingly used to read, summarize, and extract from scientific
literature. But they hallucinate: invent citations, fabricate
numbers, confidently report Tables and Figures that are not in the right place in the paper.

Post goal: peer-to-peer practical. What actually goes wrong, why, and how to
catch/reduce it in a real research workflow.

This is mainly apply if you create your own agent and work with API.

## Angle

Not "AI bad" / "AI good". Honest trade-offs. AI is useful for reading at scale,
but trust requires verification. Show concrete failure modes + mitigation.
It needs to be fast and cost effective. Attaching raw paper everytime makes it slow (token conversion), as expensive.

## Key points to cover

- What hallucination means in this context (plausible but unsupported output)
- Failure modes specific to scientific reading:
  - Fabricated/wrong citations (DOIs that don't exist, wrong authors/years)
  - Number/stat fabrication (effect sizes, p-values, sample sizes invented)
  - Overgeneralization (caveats dropped, "may" → "does")
  - Confident tone masking uncertainty
- Why it happens: next-token prediction, no ground truth by default, training gaps
- Mitigations:
  - Grounding / RAG (give it the actual paper, restrict to provided text)
  - Ask for quotes + locations, verify against source
  - Cross-check citations against real databases
  - Structured extraction with verification step
  - Human-in-loop for claims that matter
- cost: token
- time response

## Solution for Health Integrity Project

How agent avoid hallucination — review-paper skill
Two layers: prompt rules (model behavior) + infra (PDF stay grounded every turn). Both needed. Prompt alone fail when memory decays across turns; infra alone fail if model still guess.

1. PDF always real, always available
1.1 Anthropic Files API. PDF uploaded once → file_id (anthropic.ts:116). Stored in DB (anthropic_file_id). Reused across turns.
Self-healing cache. Each turn resolveAnthropicFile checks file still exist on Anthropic side (anthropic.ts:91-103). 404 = expired → re-upload from GitHub, update DB. Model never left without paper.

1.2 Citations ON. Document block has citations: { enabled: true } (chat/route.ts:180). Forces page-anchored grounding; UI streams page_location cites back. Quote tie to real page, not invented.

2. Prompt cache (cost) ≠ grounding (truth)
Cache make re-reading PDF every turn cheap, so no temptation to skip it.

PDF anchored on FIRST user message only (chat/route.ts:219), cache_control: ephemeral, ttl: '1h'. Never duplicated at tail. Full PDF stay in cached context all follow-ups.
System prompt cached, ttl: '1h' (chat/route.ts:268-273).
Last assistant msg cached (chat/route.ts:239) → moving cache breakpoint, cheap incremental turns.
Betas: prompt-caching, extended-cache-ttl (1h), files-api.
time cache = 1h TTL. Long enough for full review session. Expire → file 404 → auto re-upload (layer 1).

3. Prompt injected every message
System prompt = whole review-paper.md, sent every turn (anthropic.ts:43-52, chat/route.ts:268). Anti-hallucination rules never fall out of context:

"Every number must be string you can locate in PDF right now. If no → 'not reported'."
"Do not reconstruct numbers from memory / training data on similar papers."
MANDATORY RE-READ RULE — must re-read PDF before any figure/table/quote/number follow-up.
"Abstaining beats guessing." Don't iterate "Table 1… Table 2…" hoping right.

4. Per-turn dynamic reminders (injected, not persisted)
Built server-side, appended to model-bound user text only (chat/route.ts:97-111):

Follow-up reminder — every non-kickoff turn: "incremental only, max 5 sentences, no reprint headers." Stop review-rebloat.
Re-read reminder — fires when keyword heuristic needsPaperContext() hit (review-context.ts:34, regex line 9: p-value/figure/table/dose/CI/etc). Forces fresh PDF read, blocks memory-answer — the main hallucination source.
Reminders not saved to history → don't pollute future cached turns.

Net: PDF physically present + cited every turn (infra), re-read mandated + abstention preferred (prompt), reminders re-assert it per message (dynamic), cache make all cheap so no shortcut taken. Model can't claim no-access, can't answer from memory cheaply, told to say "not reported" over guess.

## Possible title directions

- "When AI Misreads the Paper"
- "Why Your AI Reading Assistant Invents Citations"
- "Trusting AI to Read Papers — and Verifying It"
