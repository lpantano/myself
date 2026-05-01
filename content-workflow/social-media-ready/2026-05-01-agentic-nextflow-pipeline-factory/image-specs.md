# Image Specifications

## Quote Card (Primary)

**Text**: "Context is the product. Speed comes from what the model knows before it starts."

**Design**:
- Dark background (#0f172a dark navy)
- White primary text, muted gray secondary
- Small "Data at Scale" branding mark in corner
- Clean sans-serif font (Inter or similar)
- No icons — text-only for impact

## Architecture Diagram

Phase flow diagram for Trinity orchestrator:

```
User prompt
    ↓
Trinity (Phase 0-2): Parse + Scaffold + Confirm
    ↓
    ├── Phase 3b: docker-build ──┐  [parallel]
    └── Phase 3c: get-test-data ─┤
                                 ↓
                         Phase 4: run-local
                         (stub → real, must pass)
                                 ↓
                         Phase 5: run-gcp
                         (preflight → Google Batch)
                                 ↓
                         Phase 6: Report
```

Style: minimal, monochrome or two-color (navy + teal accent), readable at mobile size. Label parallel branches clearly.

## Agent Stack Diagram (Optional)

Three-tier stack:
```
Agents     [Trinity] [docker-build] [get-test-data] [run-local] [run-gcp]
Skills     [docker-resolve] [seqera-ai]
Commands   [setup-pipeline.sh] [add-process.sh]
```

Clean horizontal layers, each tier a different shade of the same color family.
