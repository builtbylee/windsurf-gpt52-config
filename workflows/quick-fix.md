---
auto_execution_mode: 0
description: Lightweight workflow for trivial fixes - skip planning, minimal docs
---
Quick workflow for simple, obvious fixes.

## When to Use
- Single-line or few-line changes
- Typo fixes
- Obvious bug fixes
- Small UI tweaks

## Steps

1. **Implement** - Make the change directly (no planning needed)

2. **Quick Review**
   - Verify change is correct
   - Check light/dark mode if UI change
   - No scope creep

3. **Test** (if UI change)
   - Run /build to verify on device

4. **Light Documentation**
   - Update CLAUDE.md "Recently Completed" only
   - No version bump for trivial fixes

5. **Commit** (if approved)
   - Stage specific files
   - Simple commit message

## Note
If the fix turns out to be more complex than expected, switch to /workflow-protocol
