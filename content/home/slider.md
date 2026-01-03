---
# Slider widget.
widget: slider
headless: true
active: false
weight: 1

# Slide interval.
# Use `false` to disable animation or enter a time in ms, e.g. `5000` (5s).
interval: false

# Slide height (optional).
# E.g. `500px` for 500 pixels or `calc(100vh - 70px)` for full screen.
height: ''

# Slides.
# Duplicate an `item` block to add more slides.
item:
  - title: Hello
    content: 'I am center aligned :smile:'
    align: center
    overlay_color: '#666'
    overlay_img: headers/bubbles-wide.jpg
    overlay_filter: 0.5
    cta_label: Get Academic
    cta_url: 'https://sourcethemes.com/academic/'
    cta_icon_pack: fas
    cta_icon: graduation-cap

  - title: Left
    content: 'I am left aligned :smile:'
    align: left
    overlay_color: '#555'
    overlay_img: ''
    overlay_filter: 0.5

  - title: Right
    content: 'I am right aligned :smile:'
    align: right
    overlay_color: '#333'
    overlay_img: ''
    overlay_filter: 0.5
---
