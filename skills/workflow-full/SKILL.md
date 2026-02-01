---
name: workflow-full
description: Complete 7-phase workflow protocol - Plan, Implement, Review, Security, Test, Document, Commit
---

## Phase 1: Plan
- Read relevant files to understand context
- Create detailed implementation plan
- Present plan and wait for approval
- Do NOT proceed without explicit approval

## Phase 2: Implement
- Execute plan phase by phase
- Show code changes as you make them
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
- Check for exposed secrets
- Verify default values for missing data

## Phase 5: Test
- Build the app:
  ```bash
  npx expo export --platform android
  cd android && ./gradlew assembleRelease
  adb install -r app/build/outputs/apk/release/app-release.apk
  adb shell monkey -p <package> -c android.intent.category.LAUNCHER 1
  ```
- Wait for user confirmation that it works
- Fix any issues before proceeding

## Phase 6: Document
- Update TECHNICAL_MANUAL.md with version and changes
- Update CLAUDE.md with new patterns/features
- Ensure documentation is accurate and current

## Phase 7: Commit
- Stage specific files (not git add .)
- Create descriptive commit message
- Push to remote
- Copy APK to project root if applicable

## Completion
Report: "Workflow complete" with summary of what was done
