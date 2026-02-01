---
name: plan-mode
description: Enter planning mode to create detailed implementation plan before coding any non-trivial task
---

## Process

1. **Understand Requirements**
   - Read relevant existing files
   - Identify affected components
   - Note dependencies and patterns

2. **Create Implementation Plan**
   Structure the plan with:
   - Overview (1-2 sentences)
   - Files to modify (table format)
   - Phase breakdown with code snippets
   - Theme adaptation (light/dark mode)
   - Edge cases to handle
   - Testing checklist

3. **Present Plan**
   - Show the complete plan
   - Wait for user approval before implementing
   - Do NOT start coding until approved

4. **On Approval**
   - Implement phase by phase
   - Update user after each phase
   - Run build and test when complete

## Plan Template

```markdown
# [Feature Name]

## Overview
[1-2 sentence description]

## Files to Modify
| File | Changes |
|------|---------|
| path/to/file.tsx | Description |

## Phase 1: [Name]
[Code snippets and explanation]

## Phase 2: [Name]
[Code snippets and explanation]

## Testing Checklist
- [ ] Light mode verified
- [ ] Dark mode verified
- [ ] Edge cases handled
```
