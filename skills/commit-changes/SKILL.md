---
name: commit-changes
description: Git commit workflow with documentation updates, staging specific files, and pushing to remote
---

## Pre-Commit Checklist
- [ ] All changes tested and working
- [ ] TECHNICAL_MANUAL.md updated with version and changelog
- [ ] CLAUDE.md updated with new patterns/features

## Steps

1. Review current state:
   ```bash
   git status
   git diff
   ```

2. Update documentation files:
   - Add version entry to TECHNICAL_MANUAL.md
   - Update CLAUDE.md "Recently Completed" section

3. Stage specific files (never use `git add .`):
   ```bash
   git add <specific-files>
   ```

4. Commit with descriptive message:
   ```bash
   git commit -m "feat: <description of what and why>"
   ```

5. Push to remote:
   ```bash
   git push
   ```

6. Copy release APK to project root (if applicable):
   ```bash
   cp android/app/build/outputs/apk/release/app-release.apk <app-name>-release.apk
   ```

## Commit Message Format
- feat: New feature
- fix: Bug fix
- refactor: Code restructure
- style: UI/styling changes
- docs: Documentation only
- chore: Build/config changes
