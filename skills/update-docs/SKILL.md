---
name: update-docs
description: Update TECHNICAL_MANUAL.md and CLAUDE.md documentation after completing any feature, fix, or change
---

## Files to Update

### TECHNICAL_MANUAL.md
1. Increment version number (e.g., v2.6.0 -> v2.6.1)
2. Add date
3. Add changelog entry with:
   - What was changed
   - Why it was changed
   - Any new components/hooks/utilities
   - Configuration changes if applicable

Format:
```markdown
## v2.6.1 - February 1, 2026

### Changes
- [Feature/Fix]: Description of change
- [Component]: New component or modification

### New Patterns
- Description of any new patterns introduced
```

### CLAUDE.md
1. Update "Recently Completed" section
2. Add new patterns to "Important Patterns" if applicable
3. Update file references if new key files created
4. Document any platform-specific workarounds discovered

Format:
```markdown
### vX.X.X - [Feature Name]
- [x] **Feature**: Description
  - Implementation details
  - Code example if pattern is reusable
```

## Verification
- Read both files after updating to confirm accuracy
- Ensure no duplicate entries
- Keep newest entries at top
