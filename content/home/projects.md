---
# A Projects section created with the Portfolio widget.
widget: portfolio
headless: true
active: true
weight: 30

title: Portfolio
subtitle: "What I've built — more projects coming soon!"

content:
  # Page type to display. E.g. project.
  page_type: project

  # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
  filter_default: 0

  # Filter toolbar (optional).
  filter_button:
    - name: All
      tag: '*'
    - name: Pipelines
      tag: Tools
    - name: Visualizations
      tag: Visualizations
    - name: Case Studies
      tag: 'Case Study'
    - name: Health & Wellness
      tag: 'Health Data'

design:
  # Choose how many columns the section has. Valid values: '1' or '2'.
  columns: '1'
  # Toggle between the various page layout types.
  #   1 = List
  #   2 = Compact
  #   3 = Card
  #   5 = Showcase
  #   Named values (list, compact, card, showcase) avoid type warnings on newer Hugo.
  view: showcase
  # For Showcase view, flip alternate rows?
  flip_alt_rows: true
---
