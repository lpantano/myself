# 950 Million Reads That Weren't

Part of my job is finding fast ways to run open-source pipelines on sequencing data. Right now that means whole genome sequencing, and nf-core/sarek is one of the best pipelines for it. The pipeline works well. Real patient samples don't cooperate.

Biological material that's hard to isolate gave me two separate problems: DNA that wasn't diverse enough, and simply too much data.

## Problem one: when the DNA itself fights back

When DNA material isn't diverse, some low-complexity regions in the genome get over-amplified. I'd see more than 500 reads piled into a single 1kb region, where I was expecting around 50x coverage (that threshold is configurable, it's not fixed at 50x for everyone). It happened repeatedly, in different regions each time.

If the regions had stayed the same, I could have blacklisted them and moved on. They didn't, and I didn't want to keep discovering new ones by hand. Downstream tools handled these piles badly, either running out of memory or hanging for days without finishing. All of this runs on Google Cloud, so a stuck job doesn't just waste time, it burns money for as long as it sits there.

The real fix is downsampling any region that crosses the threshold, wherever it turns up. There aren't many tools built for exactly that. The closest I found was variantBAM. It has its own set of shortcuts I won't get into here, but it did the job well enough. The catch: when it drops reads to bring a region back down, it can turn a paired read into an orphan without updating the SAM flags on the mate that survives. Downstream tools read those flags, see a mate that no longer exists, and choke on it. I wrote a small Python script to fix the flags before the BAM moved further down the pipeline.

## Problem two: too much data, or so I thought

This one looked easy. If a sample came in with more than a billion read pairs, I'd use a percentage of the input instead of all of it. nf-core/sarek already splits input files into chunks before alignment, using fastp. So I didn't need new logic, just a way to use some of the existing chunks instead of all of them.

I read through fastp's command-line options and found `--split_by_lines`, which caps how many reads go into each chunk. I set it to 50 million and capped the chunk count at 19, landing on a target of 950 million read pairs. Ten minutes with Claude, it worked in testing, done.

That confidence didn't last. I hadn't designed a test that reflected real usage, I'd only checked that it ran without errors, and bioinformatics is full of bad testing 🙂. Two hundred samples later, I noticed measured coverage running 37% below expected, on average.

My first instinct was to blame the samples. They're difficult and valuable, and it's easy to assume sequencing artifacts are eating your coverage. But a 37% gap showing up consistently across many samples is a signal, not noise, so I went looking for it.

I built a real test: took a large sample I trusted, subsampled it to 20 million reads, and watched what came out the other side. One chunk went to alignment, as expected. What wasn't expected: that chunk held 9 million reads, not 50 million.

I asked Claude to trace through fastp's code and how the pipeline was calling it. The answer: fastp opens one output file per thread, 12 by default, and fills all of them at once by distributing reads across the set rather than filling one to 50 million before starting the next. If the input doesn't have enough reads to fill twelve 50-million-read files, every file ends up with whatever fraction of the input it happened to get, which can land far below the cap. My fixed count of 19 chunks rested on an assumption, 50 million reads per chunk, that only held when there was enough data to fill every thread's file completely. For most of my 200 samples, there wasn't.

The fix: count the reads in each chunk after fastp splits them, instead of assuming the cap held. I run fastp a second time per chunk purely to get that count, then pick however many chunks are needed to reach the target read total. It costs two extra processes and some channel wrangling in Nextflow, but it measures instead of assuming.

## What I took from this

Testing matters, I already knew that. The harder lesson is what to do when you don't know what to test, or your test data doesn't resemble the real thing. I'd assumed my quick test was representative. It wasn't, and the gap only showed up once real patient samples went through in volume.

If you're running your own pipeline on real patient data, assume your test data is lying to you until you've checked its output against something real. A systematic gap that repeats across sample after sample is rarely the samples' fault. Question the result before you accept it, especially the one that came back fast and clean.
