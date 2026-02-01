---
name: workflow-quick
description: Lightweight workflow for trivial fixes - Implement, Review, Test, Document, Commit
---

## Steps

1. **Implement** - Make the change directly
2. **Review** - Quick check for obvious issues
3. **Test** - Build and verify (if UI change)
4. **Document** - Update CLAUDE.md "Recently Completed"
5. **Commit** - If user approves

## Skip Conditions
- Skip Plan phase (change is obvious)
- Skip Security phase (unless touching data/inputs)
- Lighter documentation (no version bump for tiny fixes)

## Note
Use full workflow (@workflow-full) for anything non-trivial
