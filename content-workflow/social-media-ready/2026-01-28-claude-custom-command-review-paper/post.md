# Systematic Paper Reviews with Claude Custom Commands

*How I review hundreds of scientific papers consistently using AI automation*

[Watch video here](https://youtu.be/YZry3CwDwAw)

## The Problem: Inconsistent Paper Reviews

I review hundreds of scientific papers for the [Health Integrity Project](https://healthintegrityproject.org). We evaluate health claims—things you hear everywhere, like "Red raspberry leaf shortens labor"—and determine if scientific evidence supports them.

The challenge? Consistency.

Manual reviews take 30 minutes to 2 hours per paper. I might check for conflicts of interest thoroughly in one review, then forget in the next. Focus on statistical methods in one paper, skip bias assessment in another. My criteria shift paper to paper.

This inconsistency doesn't just waste time—it undermines scientific validity. If evaluation criteria change between papers, the entire project loses credibility.

## The Solution: Claude Custom Commands

Claude custom commands tell the AI model exactly how to handle a specific task. I created a command that runs the same evaluation workflow every single time.

The workflow asks:
- Are there conflicts of interest?
- Is this a valid study type (not narrative reviews)?
- Is the control group adequate?
- What biases exist?
- Do results align with the claim?

Each paper goes through identical steps. Nothing gets skipped.

## How It Works

A custom command is a markdown file in your project folder (`.claude/commands/`). Mine is called `review-paper.md`.

### Basic Structure

Every custom command has three parts:

1. **Input**: What you provide
2. **Task**: What Claude should do
3. **Output format**: How results should look

Here's the minimal markdown structure:

```markdown
# Command Name

## Input
- Item 1 (e.g., paper location)
- Item 2 (e.g., claim to evaluate)

## Task
Step-by-step instructions for Claude to follow

## Output Format
How you want results structured
```

### My Paper Review Workflow

```markdown
## Step 1: Validation Screen
- Check conflict of interest
- Identify study type
- Flag narrative reviews or meta-analyses
- Output: VALID or INVALID with reasons

## Step 2: Quality Assessment
- Evaluate control groups
- Assess statistical methods
- Identify biases
- Output: Quality rating with evidence

## Step 3: Result Alignment
- Compare study results to claim
- Determine if supporting or contradicting
- Output: Category recommendation
```

## Real Example: Raspberry Leaf Study

I run the command: `/review-paper`

Claude asks for:
- Paper location
- Claim being evaluated
- Paper position (supporting or contradicting)

I provide:
- Paper: `raspberry-study.pdf`
- Claim: "Red raspberry leaf shortens labor and helps induce birth"
- Position: Supporting

Claude starts the evaluation:

**Step 1 Results:**
- Funding: Company involvement noted, but primary funding independent
- Study type: Human clinical trial (valid)
- No narrative meta-analysis
- Status: Proceed to quality check

**Step 2 Results:**
- Control group: Present
- Statistical methods: Adequate sample size, appropriate tests
- Biases: Selection bias possible (self-reported outcomes)

**Step 3 Results:**
- Study results: No significant difference in labor duration
- Alignment with claim: CONTRADICTS
- Category: Misinformation (claim unsupported by results)

At each step, I can interact: "Dig deeper into selection bias" or "Show exact quote about labor duration from paper."

## Beyond Paper Reviews

Custom commands work for any repeated workflow.

Example for bioinformatics:

```markdown
Command: /optimize-nextflow

Input: Pipeline directory

Task:
1. Analyze resource usage from execution reports
2. Calculate actual vs requested CPU/memory
3. Ignore failed jobs
4. Generate updated resource config
5. Optional: Update nextflow.config

Output: Resource optimization recommendations
```

## Why This Matters

**Time savings**: Reviews that took 1-2 hours now take 30 minutes.

**Consistency**: Same questions, same order, every paper.

**Thoroughness**: Nothing gets forgotten or skipped.

**Transparency**: The workflow is documented and repeatable.

The custom command doesn't replace my judgment—it retrieves information and ensures I evaluate every paper the same way. I still make final decisions. I still dig deeper when needed.

**What custom commands can't do**: Make subjective quality judgments, understand context outside the paper, or catch every nuance in complex statistical methods. They work best for structured, repeatable workflows where the steps are clear.

But I never miss conflict of interest checks again. I never forget to assess control groups. The baseline evaluation happens consistently.

## Getting Started

1. Find a workflow you repeat frequently
2. Document the steps
3. Define input, task, and output format
4. Create a markdown file in `.claude/commands/`
5. Test and refine

Start simple. Even basic workflows benefit from automation.

The goal isn't to hand everything to AI. It's to ensure your systematic processes stay systematic.

---

**Resources:**
- [Health Integrity Project](https://healthintegrityproject.org) - Evidence-based health claim evaluation
- [Claude Custom Commands Documentation](https://code.claude.com/docs/en/skills) - How to create your own commands
- [Health Integrity Review Workflow](https://healthintegrityproject.org/workflow) - Our paper evaluation process

*Have you tried custom commands for your repeated workflows? What tasks would benefit from systematic automation in your work?*
