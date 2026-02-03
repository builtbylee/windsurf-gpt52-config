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

## When NOT to Use
If the fix involves ANY uncertainty or assumptions, use /workflow-protocol instead.

## Steps

1. **Quick Assumption Check**
   Even for quick fixes, if there's any ambiguity:
   ```
   ASSUMPTION: [what you're assuming]
   → Proceeding unless you correct me.
   ```

2. **Implement** - Make the change directly

3. **Quick Review**
   - Verify change is correct
   - Check light/dark mode if UI change
   - No scope creep
   - No secrets exposed

4. **Test** (if UI change)
   - Run /build to verify on device

5. **Light Documentation**
   - Update CLAUDE.md "Recently Completed" only
   - No version bump for trivial fixes

6. **Commit** (if approved)
   - Stage specific files
   - Simple commit message
   - Brief change summary:
     ```
     CHANGED: [file] - [what]
     ```

## Note
If the fix turns out to be more complex than expected, STOP and switch to /workflow-protocol. State:
"This is more complex than expected. Switching to full workflow. Here's why: [reason]"
