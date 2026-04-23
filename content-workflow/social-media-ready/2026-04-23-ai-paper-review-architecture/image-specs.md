# Image Specifications

## Quote Card (Primary)

**Text**: "A blank form doesn't help. A chatbot that just answers questions doesn't help either. What helps is a structured interview."

**Design**:
- Dark background (#0f172a or similar dark navy)
- White primary text, muted secondary text
- Small "Data at Scale" branding mark in corner
- Clean sans-serif font (Inter or similar)
- No icons — text-only for impact

## Architecture Diagram (Optional)

A simple flow diagram showing the reviewer journey:

```
Reviewer → Upload PDF → GitHub storage
                     ↓
              Anthropic Files API (cached file_id)
                     ↓
         Claude (system prompt + paper + claim)
                     ↓
         Structured chat interview (streamed)
                     ↓
         JSON output → editable form → submit
                     ↓
         GitHub archive + Supabase score + evidence_status recalculation
```

Style: minimal, monochrome or two-color, readable at mobile size.
