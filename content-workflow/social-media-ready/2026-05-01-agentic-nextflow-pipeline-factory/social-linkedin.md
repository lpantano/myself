Presented at Nextflow Summit 2026: how I built an agentic pipeline factory for a lab where one person does every role.

One sentence triggers a 6-phase agent: parse tools → resolve containers → prep test data → local run → GCP Batch → report. 🧬

The lesson: speed comes from context, not model intelligence. `.memory/` files encoding lab conventions — container registry hostnames, package managers, GCP spot retry codes — cut wrong turns before they happen.

Three hard rules that took real failures to learn:
1. Never pre-supply the container image — the agent skips test data and cloud run
2. Spawn the orchestrator once — each spawn starts fresh, state doesn't carry
3. Write `.memory/` before writing agents — an agent without context makes the same mistakes as a model with none

Full architecture breakdown → [[link]]

#Nextflow #Bioinformatics #AIAgents #GCP #PipelineAutomation
