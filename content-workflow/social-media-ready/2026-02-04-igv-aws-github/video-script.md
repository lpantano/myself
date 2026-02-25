# Video Script: Sharing Genomics Data Across Collaborators

**Duration:** 6-7 minutes
**Format:** Tutorial/case study
**Tone:** Clear, direct, practical

---

## OPENING (0:00-0:30)

[Visual: Show multiple data files on screen or collaborators working]

**Narrator:**
"Imagine this: Your collaborators send you differential expression results from their single-cell RNA experiments. Someone's working with mouse data. Someone else has human samples. Another person did ChIP-seq work. Your job? Find the genes they identified as significant, check the signal in all those other experiments, and compare across species. From a single interface. In seconds."

[Pause]

"That sounds complicated. But it doesn't have to be. We solved this without hiring a development team. Here's how."

---

## PROBLEM (0:30-1:30)

[Visual: Show a file explorer with many different file types - CSV, VCF, BED, etc.]

**Narrator:**
"Let's start with the problem. Collaborative genomics projects generate heterogeneous data. Different file formats. Different species. Different experiment types. All living in different folders. All coming from different labs."

[Visual: Show someone manually looking up gene coordinates, switching between databases]

"Without infrastructure, you're manually doing this: looking up genes in a database, translating between genome builds, checking signal in one experiment at a time. It doesn't scale."

[Visual: Zoom out to show multiple collaborators, multiple data folders, multiple tools]

"As your collaboration grows, this becomes untenable. You need one place to explore any gene across all experiments. But you don't have a dedicated development team. And you definitely don't have a big budget."

[Pause]

"So what do you do?"

---

## THE APPROACH (1:30-2:30)

[Visual: Show three boxes on screen]

**Narrator:**
"We made three decisions: composition, standardization, and automation."

[Visual: Highlight Box 1 - "Choose existing tools"]

"First, choose existing tools that already do 80% of what you need."

[Visual: Show IGV interface - genome viewer]

"We picked IGV. The web app version. IGV is an interactive genome browser. You can jump from gene to gene, load different data types, search across the genome. It's exactly what we need."

[Pause]

"We didn't build visualization code. IGV handles that for us. That saved us months of development."

[Visual: Highlight Box 2 - "Standardize formats"]

"Second, standardize everything into formats IGV understands."

[Visual: Show CSV file → arrow → BED file]

"IGV natively works with BED files, bigWig files, bedGraph files. Our collaborators send CSV files with differential expression results—gene names and significance values."

[Pause]

"So we built a conversion script. It's not complicated. It reads the CSV, extracts the genes and their significance, and converts it to a BED file."

[Visual: Show BED file format with color coding]

"Color coding has biological meaning. Red for up-regulated genes. Blue for down-regulated. Orange for genes that are significant but have low fold change. Gray for not significant. At a glance, you know what's happening."

[Pause]

"But here's where the automation gets really smart: the script also handles cross-species translation."

[Visual: Show mouse gene names → ortholog mapping → human coordinates]

"If your collaborators send data from mouse experiments, the script automatically maps mouse genes to their human orthologs and converts coordinates to hg38. So when you search for a mouse gene, you're actually looking at the equivalent location in the human genome. Everything aligns. No manual lookup."

[Highlight Box 3 - "Automate everything"]

"Third, automate the entire deployment pipeline."

[Visual: Show folder → GitHub Action → AWS S3 → IGV]

"Here's the flow: Collaborators put new data in a shared folder. We trigger a GitHub Action. The action runs the conversion script on all new data, generates an updated track registry for IGV, and uploads everything to an AWS S3 bucket."

[Pause]

"Within seconds, that new data is live in IGV. No manual deployment. No waiting for someone with backend expertise. It just works."

---

## ARCHITECTURE DEEP DIVE (2:30-4:30)

[Visual: Show system architecture diagram]

**Narrator:**
"Let's look at the technical pieces."

[Visual: Highlight data storage]

"Everything lives on AWS S3 in a private bucket. Collaborators can't directly access it. Instead, they go through a web interface."

[Visual: Show authentication layer]

"We added Lambda functions that handle authentication. When someone tries to access the data, Lambda asks for a username and password. Only people on the access list get through."

[Pause]

"This is important. Your research data is sensitive. You need to control who sees it."

[Visual: Show IGV web app]

"On top of that, IGV runs as a web app. Users authenticate, then IGV loads the data from S3. They're now browsing your genome."

[Visual: Show data organization - Projects → Experiments → Tracks]

"We organized the data hierarchically. Three main research projects. Multiple experiments within each project. Each experiment is a track in IGV."

[Pause]

"When you open the IGV interface, you see three track menus—one for each project. Click on a project, and you see all its experiments listed in a table. Search, sort, explore."

[Visual: Demo IGV interface]

"That table view is powerful. You can search for your experiment by name. Sort by date. Filter by project. Then click and load it into the genome browser."

[Visual: Show GitHub Action workflow]

**Narrator:**
"Now, how do we handle new data? GitHub Actions with S3 integration."

[Visual: Show workflow steps in sequence]

"The action runs on a schedule—say, once a day. Or you can trigger it manually from GitHub. Here's what it does:"

[Visual: Step 1 - Mount S3, scan projects]
"One, mount the S3 bucket and scan all projects for new CSV files."

[Visual: Step 2 - Run conversion pipeline]
"Two, run the automation script. It discovers all projects, converts new CSV files to BED format with our four-color significance coding, and generates updated project registries."

[Visual: Step 3 - Sync back to S3]
"Three, sync the updated metadata (CSV and JSON files) back to S3."

[Visual: Step 4 - Fix MIME types]
"Four, fix MIME types for BigWig files—a technical detail IGV needs."

[Visual: Step 5 - Invalidate CloudFront]
"Five, invalidate the CloudFront cache so users see the updates immediately."

[Pause]

"The whole process takes maybe a minute. Your collaborators' new data is live in IGV."

---

## WHY THIS WORKS (4:30-5:30)

[Visual: Return to problem statement from earlier]

**Narrator:**
"Remember that problem we started with? Multiple collaborators, heterogeneous data, limited resources, no dev team?"

[Pause]

"This approach solves it because it's pragmatic."

[Visual: Show the three principles]

"Composition: we chose a tool that already solved 80% of the problem. We didn't reinvent the wheel."

[Visual: Show automation]

"Automation: we automated the 20% IGV doesn't handle. Format conversion. Species translation. Deployment. The computer does it, not people."

[Visual: Show scaling]

"Scalability: as new collaborators join and new data arrives, the same automation handles it. You don't need to hire more people or write new code."

[Pause]

"This is the insight: you don't need a big development team to build sophisticated research infrastructure. You need clear thinking about the problem, the right existing tools, and automation for the gaps."

---

## CLOSING (5:30-6:30)

**Narrator:**

"The full code is open source on GitHub. Link in the description."

[Visual: Show key takeaways on screen]

"Here's what to remember:"

[Visual: Point 1]
"One: Composition beats custom code when your resources are limited."

[Visual: Point 2]
"Two: Standardization—forcing data into common formats—is the foundation of automation."

[Visual: Point 3]
"Three: Automation via GitHub Actions eliminates the manual, error-prone deployment steps."

[Pause]

"If you have a similar challenge in your research—multiple collaborators, heterogeneous data, limited budget—this approach works. Think about what tools already exist for 80% of your problem. Then focus your engineering on the 20% they don't cover."

[Visual: End screen with project GitHub link]

"Thanks for watching. Check the description for the full code and blog post."

---

## NOTES FOR PRODUCTION

**Visual Elements to Prepare:**
- Screenshots of IGV interface
- Folder structure and file organization diagrams
- System architecture diagram (S3 → Lambda → IGV)
- CSV to BED conversion example
- Genome coordinate translation example
- GitHub Actions workflow visualization
- Demo of the working system

**Pacing Notes:**
- First 1:30 is hook and problem (keep viewers engaged)
- 1:30-2:30 is the approach overview (establish the structure)
- 2:30-4:30 is the deep dive (technical details)
- 4:30-5:30 is "why this works" (connection to the audience)
- 5:30-6:30 is closing and key takeaways

**Key Phrases to Emphasize:**
- "Composition beats custom code"
- "Automate the 20%"
- "Collaboration scales without hiring"
- "Standardization enables automation"

**Recommended Visuals for Each Section:**
- Opening: Show the problem in action (files, collaborators, manual work)
- Problem: File explorer, manual gene lookup, growing data
- Approach: Three-box diagram with clear labels
- Architecture: System diagram with data flow
- Technical: Step-by-step workflow visualization
- Why it works: Before/after comparison or scaling visualization
- Closing: Demo of working system, code repository
