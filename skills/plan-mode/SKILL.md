# Plan Mode

Enter planning mode to create detailed implementation plan before coding any non-trivial task.

## Process

1. **Understand Requirements**
   - Read relevant existing files
   - **SECURITY**: May access .env/secret files if needed to understand config, but NEVER display their values in output
   - Identify affected components
   - Note dependencies and patterns
   - When searching: always exclude sensitive file patterns from grep/search output

2. **Surface Assumptions**
   Before creating the plan, explicitly state:
   ```
   ASSUMPTIONS:
   1. [assumption]
   2. [assumption]
   → Correct me now or I'll proceed with these.
   ```

   If requirements are unclear or conflicting: STOP and ask, don't guess.

3. **Push Back If Needed**
   If the requested approach has clear problems:
   - Point out the issue directly
   - Explain the concrete downside
   - Propose an alternative
   - Accept user's decision if they override

4. **Create Implementation Plan**
   Structure the plan with:
   - Overview (1-2 sentences)
   - Files to modify (table format)
   - Phase breakdown with code snippets
   - Theme adaptation (light/dark mode)
   - Edge cases to handle
   - Testing checklist

5. **Present Plan**
   - Show the complete plan
   - **SECURITY**: Use placeholders like `process.env.API_KEY` not actual values
   - Wait for user approval before implementing
   - Do NOT start coding until approved

6. **On Approval**
   - Implement phase by phase
   - Update user after each phase
   - Run build and test when complete

## Plan Template

```markdown
# [Feature Name]

## Assumptions
1. [assumption]
2. [assumption]

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

## Security Considerations
- [ ] No hardcoded secrets
- [ ] Environment variables used for sensitive config

## Testing Checklist
- [ ] Light mode verified
- [ ] Dark mode verified
- [ ] Edge cases handled
```
