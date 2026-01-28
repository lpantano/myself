# Video Script: How I Use Claude Code to Review Scientific Papers

**Target Audience**: Scientists
**Duration**: 5-7 minutes
**Tone**: Amicable, concise, technical but accessible

---

## Hook (15 seconds)

I review hundreds of scientific papers for Health Integrity Project.

Each review follows a strict workflow: validation, quality checks, classification.

I built a custom Claude Code command that handles this entire process.

Let me show you how it works.

---

## Problem Setup (30 seconds)

When evaluating scientific papers, consistency matters.

Did I check for conflicts of interest? Was the control group adequate? Did I assess bias?

Manual reviews take 30-60 minutes. I forget steps. My criteria drift.

I needed a systematic approach that runs the same evaluation every time.

Claude Code's custom commands solve this.

---

## What Are Custom Commands? (45 seconds)

Custom commands are instructions you save in your project.

They tell Claude exactly how to handle specific tasks.

In my case: review a paper following Health Integrity Project's classification workflow.

Here's the structure:

[SCREEN: Show .claude/commands/ folder]

Custom commands live in `.claude/commands/` as markdown files.

I created `review-paper.md` with my complete evaluation framework.

Now when I run `/review-paper`, Claude follows my exact process.

---

## The Review Paper Command (2 minutes)

My command implements a decision tree with five steps.

[SCREEN: Show review-paper.md file, highlight sections]

**Step 1: Validation Screen**

Checks for conflicts of interest, review studies, overstated claims.

If any fail, paper is classified as Invalid or Misinformation.

**Step 2: Quality Assessment**

Evaluates study design, control groups, bias handling, statistics.

Fails here mean Inconclusive.

**Step 3: Study System**

Identifies if it's cell culture, animal models, or human studies.

Non-human studies stop here: Not Tested in Humans.

**Step 4-5: Human Studies Only**

Study type: observational or clinical trial.

Sample size determines final classification.

Less than 100: Limited Tested in Humans.

100 to 500,000: Tested in Humans.

Over 500,000: Widely Tested in Humans.

The command extracts metadata: age ranges, ethnicity, gender inclusion.

It generates a structured review with direct quotes from the paper.

---

## How I Use It (90 seconds)

[SCREEN: Terminal showing actual usage]

I open Claude Code in my project directory.

Type `/review-paper` and provide the paper.

I can give a DOI, URL, or PDF path.

I specify the claim being evaluated.

I tell Claude if the paper supports or contradicts the claim.

[SCREEN: Show Claude starting the workflow]

Claude fetches the paper using WebFetch or reads the PDF.

It works through the decision tree step by step.

**Here's the key**: Claude stops at each step for my feedback.

It asks: "Should I continue? Any corrections?"

This keeps me in control.

[SCREEN: Show example review output]

After Step 1, it shows validation results.

I review. If correct, I say continue.

It moves to quality assessment.

Again, stops for feedback.

This continues through all steps.

[SCREEN: Show final review output]

The final output includes:

- Complete classification with rationale
- Study design summary
- Key findings with direct quotes from the paper
- Limitations
- Metadata tags
- Expert comment for laypersons under 500 characters

---

## Why This Works (45 seconds)

Three reasons this command saves me time:

**Consistency**: Same evaluation criteria every time.

**Thoroughness**: I never skip steps or forget checks.

**Efficiency**: Reviews that took 2 hours now take 15-30 min.

But the real value is collaboration.

Claude does the structured analysis.

I provide domain expertise and catch nuances.

Together we produce better reviews faster.

---

## How You Can Build Your Own (60 seconds)

Custom commands work for any repetitive, structured task.

You don't need to be a programmer.

Create a markdown file in `.claude/commands/`.

Write instructions in plain language.

Tell Claude:
- What inputs to expect
- What steps to follow
- What output format to use
- When to stop for feedback

[SCREEN: Show simple command template]

```markdown
# My Command Name

## Input
[What you'll provide]

## Task
[What Claude should do]

## Output Format
[How results should look]

## Instructions
[Step-by-step process]
```

Claude reads this and follows it exactly.

The more specific your instructions, the better results you get.

---

## Examples Beyond Paper Reviews (60 seconds)

Custom commands work for any repetitive task.

Here are simple bioinformatics examples:

[SCREEN: Show example command files]

**Quality Check Command** (`.claude/commands/qc-fastq.md`):

```markdown
Check FASTQ file quality for $ARGUMENTS.
- Report read count and length distribution
- Flag quality scores below 30
- Identify adapter contamination
- Summarize in table format
```

**Nextflow Resource Optimization** (`.claude/commands/optimize-nextflow.md`):

```markdown
Analyze Nextflow resource usage from $ARGUMENTS trace file.
- Identify processes using less resources than allocated
- Calculate actual vs requested CPU and memory
- Ignore failed jobs - don't increase resources for failures
- Generate updated resource config recommendations
- Optional: Update nextflow.config with new resource config file that work for your data or point the user how to use the new config file
```

**Data Validation** (`.claude/commands/validate-metadata.md`):

```markdown
Validate sample metadata file $ARGUMENTS.
- Check required columns present
- Verify sample IDs match naming convention
- Flag missing or inconsistent values
- Output validation report
```

Each command is just markdown with instructions.

Simple. Reusable. Consistent.

---

## Getting Started (45 seconds)

You need Claude Code installed.

Download it at claude.com/claude-code.

Create a `.claude/commands/` directory in your project.

Write your first command as a markdown file.

[SCREEN: Show creating first command]

Filename becomes the command name.

`qc-check.md` becomes `/qc-check`.

Inside: plain language instructions for Claude.

Start simple. Refine over time.

Check out command collections for templates:

- code.claude.com/docs - Official documentation
- github.com/wshobson/commands - 57 production commands
- github.com/qdhenry/Claude-Command-Suite - 148+ commands
- github.com/hesreallyhim/awesome-claude-code - Curated examples

---

## Closing (20 seconds)

Custom commands turn Claude Code into a personalized research assistant.

You define the workflow once.

Run it hundreds of times.

For Health Integrity Project, it means consistent, thorough paper reviews.

For you, it could mean time back in your day.

What repetitive task will you automate first?

---

## End Screen

**Health Integrity Project**: healthintegrityproject.org
**Claude Code**: claude.com/claude-code
**Documentation**: code.claude.com/docs
**Command Examples**:
- github.com/wshobson/commands
- github.com/qdhenry/Claude-Command-Suite
- github.com/hesreallyhim/awesome-claude-code

---

## Notes for Video Production

**Visual Elements:**
- Screen recordings of actual command usage
- Highlight sections of code/markdown as you discuss them
- Show before/after: manual review time vs. command time
- Use callout boxes for key concepts
- Terminal recordings with clear, readable text

**Pacing:**
- Keep cuts tight
- Use B-roll sparingly
- Let screen recordings do the teaching
- Your voice should guide, not overwhelm

**Accessibility:**
- Add captions for all speech
- Use high contrast for code examples
- Keep text on screen long enough to read
- Call out what you're showing: "Now I'm opening the review-paper file"

**B-Roll Suggestions:**
- Typing in terminal
- Creating a simple command file
- Scrolling through the review-paper command file
- Claude's responses appearing step by step
- Final review document output
- Simple bioinformatics command examples
- Command examples from public repos
