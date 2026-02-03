# Workflow Protocol

Complete 7-phase workflow protocol for non-trivial tasks.

## Phase 1: Plan
- Read relevant files to understand context
- **SECURITY**: May access .env/secret files if needed, but NEVER display their values
- When searching codebase, include exclusions to avoid matching inside secret files
- **STATE ASSUMPTIONS** before proceeding:
  ```
  ASSUMPTIONS:
  1. [assumption]
  2. [assumption]
  → Correct me now or I'll proceed with these.
  ```
- If requirements are unclear or conflicting: STOP and ask, don't guess
- Create detailed implementation plan with:
  - Overview (1-2 sentences)
  - Files to modify (table format)
  - Phase breakdown with code snippets
  - Theme adaptation (light/dark mode)
  - Edge cases to handle
- **Push back** if the approach has clear problems - explain the issue and propose alternatives
- Present plan and wait for approval
- Do NOT proceed without explicit approval

## Phase 2: Implement
- Execute plan phase by phase
- Show code changes as you make them
- **SECURITY**: Never hardcode secrets - use environment variables
- Pause after each phase for verification if complex

## Phase 3: Review
- Run through code review checklist
- Check pattern consistency
- Verify theme compatibility (light/dark)
- Check for React Native Android issues
- Extra attention to concurrency/async code

## Phase 4: Security
- Validate all user inputs
- Ensure parameterized queries (no SQL injection)
- **Verify no secrets exposed in**:
  - Code (hardcoded values)
  - Console.log/print statements
  - Comments or documentation
  - Error messages
  - Any output shown to user during this session
- Verify default values for missing data

## Phase 5: Test
- Build the app
- Wait for user confirmation that it works
- Fix any issues before proceeding

## Phase 6: Document
- Update TECHNICAL_MANUAL.md with version and changes
- Update CLAUDE.md with new patterns/features
- Ensure documentation is accurate and current
- **SECURITY**: Never include actual secret values in documentation

## Phase 7: Commit
- **Pre-commit security check**:
  - No .env* files staged
  - No secrets in staged code
  - No secrets in commit message
- Stage specific files (not git add .)
- Create descriptive commit message
- **Provide change summary**:
  ```
  CHANGES MADE:
  - [file]: [what and why]

  DIDN'T TOUCH:
  - [file]: [why left alone]

  POTENTIAL CONCERNS:
  - [risks to verify]
  ```
- Push to remote
- Copy APK to project root if applicable

## Completion
Report: "Workflow complete" with summary of what was done
