# Why I Built My Own Running Dashboard

Your watch buzzes. "Congratulations on your fastest 5K this month!"

But you don't feel faster. And last month, you had three "fastest" runs that contradicted each other.

I kept getting these notifications. Weekly summaries told me I was improving. Or declining. Or both, depending on which metric the app decided mattered that week.

The numbers existed. But they meant nothing without context.

So I built my own dashboard to see what was actually happening.

## The Problem With Fitness Apps

Fitness apps celebrate individual achievements. A personal record. A streak maintained. A badge earned.

They show weekly summaries that create false urgency. Up 10% from last week feels like progress. Down 5% feels like failure.

But fitness doesn't work on weekly cycles. Your body adapts over months, not days, even years.

Individual run metrics mean nothing without seeing the bigger picture over time. Context matters more than numbers.

## What I Wanted

I started following a structured training program ([Tactic Method](https://tacticmethod.com) with coach Alex Parker). Run-walk intervals. Progressive distance. Specific pace targets.

I wanted to answer one question: Is this structured approach actually working?

Not based on how I felt after one run. Not based on weekly summaries that changed with the weather.

Based on months of data showing whether the effort was producing results.

And I wanted to own my data. Not pay for premium features to see insights about my own body, that I cannot even control.

## What I Built

I created a dashboard that:
- Downloads my Garmin FIT files automatically
- Tracks time, distance, pace, and heart rate across all runs
- Visualizes trends over months with run/walk intervals separated
- Shows training events and phases marked on the timeline

The technical stack: Python for data extraction, React with Plotly for visualization. I'm a scientist who codes for data analysis, so I adapted familiar tools to a new domain.

Not a polished product. A working tool to see patterns.

[Include screenshot: Distance over time with trend line]

[Include screenshot: Training events marked on timeline]

## What I Learned

### 1. Numbers Without Context Are Noise

That "slow" run last Tuesday? Probably faster than any run you did six months ago.

Your watch tells you about one data point. The dashboard shows whether that point is part of an upward trend, a plateau, or normal variation.

Single metrics mean nothing. Patterns over time mean everything.

### 2. Week-to-Week Progress Is a Myth

My data revealed:
- Three weeks with no visible improvement
- A sudden jump after a rest week
- A plateau that broke when I changed training structure

Apps want you to believe weekly progress is linear. The data shows it's messy, inconsistent, and happens in waves.

[Research shows](https://pmc.ncbi.nlm.nih.gov/articles/PMC6492765/) that structured training produces measurable improvements at 12-week intervals. Not weekly. Not even monthly in most cases.

Week-to-week numbers are all over the place. That's normal. That's adaptation.

### 3. Structured Training Shows Up in Data

When I started following the Tactic Method program, I could see the changes:
- Distance trend line slope increased
- Run and walk interval paces became more consistent
- Heart rate at the same pace dropped over time

Not after one week. After months.

[Studies confirm](https://pmc.ncbi.nlm.nih.gov/articles/PMC7590922/) that structured, periodized training programs are more effective than unstructured running. The research uses the exact phrase: "periodized training elicited greater improvements in endurance performance than nonperiodized training, highlighting the importance of planned training structure."

My data matched what the science predicts.

### 4. Seeing Accumulation Keeps You Going

This was the unexpected benefit.

The most powerful insight wasn't about trends or training effectiveness. It was seeing the pile of work already done.

When energy is low and motivation fades, the dashboard doesn't show a streak to maintain or a goal to chase. It shows months of accumulated effort.

Evidence: you've already done this much. You can keep going.

Apps celebrate streaks because they want daily engagement. This celebrates accumulation because it shows long-term commitment.

The difference matters when you need a push to get out the door.

### 5. You Can Trust the Long Game

Apps want you to check daily. Adult trials behind the [2024 Lancet Digital Health review](https://www.thelancet.com/journals/landig/article/PIIS2589-7500(24)00139-0/fulltext) suggest that wearables support more lasting gains when people pay attention to long-term activity patterns, not just to daily alerts and streaks.

Real fitness happens slowly. [Cardiorespiratory improvements](https://journals.physiology.org/doi/full/10.1152/japplphysiol.01152.2009) begin within 3 weeks but continue developing over 9-12 weeks.

The monthly view shows what daily anxiety misses: whether your training is actually working.

## How You Can Do This

Not a full tutorial, but guidance:

### Get Your Data
Garmin lets you download FIT files from your activities. These contain all the metrics your watch records during runs.

### Choose Your Tools
I used Python and React because I'm comfortable with data analysis. But tools don't matter as much as seeing patterns.

If you're not comfortable with code, AI tools like Claude or GitHub Copilot can bridge the gap. They can explain code, suggest modifications, and help you troubleshoot errors.

The goal is visualization, not perfection.

### Start Simple
Pick one metric that matters to you. Distance. Pace. Heart rate. Track it over time.

Don't try to build everything at once.

### Be Patient
You need months of data to see meaningful trends. Three months minimum. Six months better.

This isn't an instant gratification project.

### Use My Code as a Starting Point
I've shared the project on [GitHub](https://github.com/lpantano/run-training-dashboard). It's not a finished product. It's a foundation you can customize.

### AI Tools Can Help
Don't let the code intimidate you. Tools like Claude or GitHub Copilot can help you understand and modify the code.

Ask them: "Explain what this function does." Or: "How do I change this to track weekly averages instead of daily runs?"

These AI assistants make working with code more accessible. You don't need to be a programmer to adapt this dashboard to your needs.

**Want help?** If you have Garmin data and want something similar, reach out. I'm offering to help set this up for others who want to see their training in context.

Yes, there's technical setup. But between AI tools and my offer to help, you have support to figure it out.

## The Real Insight

Fitness apps are designed to keep you engaged daily. Your body improves monthly.

The best training insight isn't from one run. It's from seeing six months of context that reveals whether your effort is actually working.

And when motivation dips, it's not another badge you need. It's seeing the work you've already accumulated.

That's what keeps you going.

---

## Try It Yourself

Start by exporting your own data and looking at it. Not through an app's filtered view. Just the raw patterns over time.

What might you discover in your own training?

**Project Repository**: [run-training-dashboard](https://github.com/lpantano/run-training-dashboard)

**Want help setting this up?** Contact me through [GitHub](https://github.com/lpantano) or my [website](https://lpantano.github.io).

---

## Sources

- [Time course and mechanisms of adaptations in cardiorespiratory fitness with endurance training](https://journals.physiology.org/doi/full/10.1152/japplphysiol.01152.2009) - Journal of Applied Physiology
- [Changes in Physical Fitness After 12 Weeks of Structured Training](https://pmc.ncbi.nlm.nih.gov/articles/PMC6492765/) - PMC
- [Effects of Linear Periodization Training on Performance Gains](https://pmc.ncbi.nlm.nih.gov/articles/PMC7590922/) - PMC
- [Effect of wearable activity trackers on physical activity](https://www.thelancet.com/journals/landig/article/PIIS2589-7500(24)00139-0/fulltext) - The Lancet Digital Health, 2024
- [Tactic Method Training Program](https://tacticmethod.com) - Structured running program reference
