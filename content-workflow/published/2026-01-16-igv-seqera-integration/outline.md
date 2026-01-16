# Post Outline: Viewing Genomic Data Where It Lives

## Working Title Options
1. "Stop Downloading BAM Files to View Them"
2. "Visualization That Comes to Your Data"
3. "Close the Gap Between Pipeline and Inspection"

## Structure

### Hook (1 paragraph)
Open with the common frustration: You just ran a pipeline that generated 50GB of BAM files in the cloud. Now you need to check alignment quality. Do you really have to download everything to run IGV locally?

### The Workflow Gap (1-2 paragraphs)
Describe the current friction:
- Analysis happens in cloud (fast compute, scalable storage)
- Visualization happens locally (manual downloads, disk space constraints)
- This gap slows iteration and wastes time

This isn't just inconvenient - it affects research velocity and reproducibility.

### What IGV Integration Solves (1-2 paragraphs)
Introduce the solution without technical details yet:
- IGV runs as a web app directly in your Seqera workspace
- Connects to the same cloud storage your pipelines write to
- Automatically discovers and catalogs all genomic files
- Zero download, zero manual file loading

### How It Works (2-3 paragraphs)
Brief technical explanation (accessible but specific):
1. **Container architecture**: IGV web app + Seqera connect-client
2. **Storage mounting**: Cloud data appears as local filesystem via FUSE
3. **Automatic discovery**: Startup script scans for .bam, .vcf, .bed, etc.
4. **Track catalog generation**: Creates IGV-compatible menus from found files

Key point: The visualization tool comes to where data already lives, not the other way around.

### What This Looks Like in Practice (1-2 paragraphs)
Walk through user experience:
- Launch the IGV Studio from Seqera interface
- Browser opens with IGV web app
- Click "Tracks" menu → "Auto-discovered Tracks"
- See table of all your BAM files, VCF variants, coverage tracks
- Click to load - instant visualization

### Why This Matters for Your Work (2-3 paragraphs)
Concrete benefits:
- **Faster QC cycles**: Check alignments immediately after pipeline runs
- **Better collaboration**: Share browser URL instead of massive files
- **Cost reduction**: No storage duplication, reduced egress fees
- **Easier onboarding**: New team members don't need complex local setups
- **Reproducibility**: Everyone views the same authoritative data source

### Getting Started (1 paragraph)
Where to find it:
- Link to GitHub repository with full code and documentation
- Note that it's open source and customizable
- Mention it's one example from Seqera's custom studios collection

### Closing (1 paragraph)
Broader point: Cloud-native analysis means rethinking entire workflows, not just moving compute. Bringing visualization to cloud data is part of that shift. The less time you spend moving data around, the more time you spend understanding it.

## Tone Notes
- Technical but accessible (assume genomics background, not necessarily DevOps)
- Focus on practical pain points, not abstract benefits
- Show respect for readers' time (they deal with this frustration daily)
- Concrete examples, not vague promises
- Acknowledge this is one solution approach, not "the only way"

## Length Target
800-1000 words (keep it concise, respect the "minimal words" principle)

## Key Sources to Cite
- IGV publication (Robinson et al., 2011, Nature Biotech) DOI: 10.1038/nbt.1754
- Link to implementation: https://github.com/seqeralabs/custom-studios-examples/tree/main/igv
- Seqera Studios documentation: https://docs.seqera.io/platform-cloud/studios/
