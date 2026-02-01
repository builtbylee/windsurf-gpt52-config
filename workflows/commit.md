---
auto_execution_mode: 0
description: Git commit workflow with documentation updates and push to remote
---
Commit changes following the established git protocol.

## Pre-Commit Checklist
- [ ] All changes tested and working
- [ ] TECHNICAL_MANUAL.md updated with version and changelog
- [ ] CLAUDE.md updated with new patterns/features

## Steps

1. **Review current state**
   ```bash
   git status
   git diff
   ```

2. **Update documentation**
   - Add version entry to TECHNICAL_MANUAL.md
   - Update CLAUDE.md "Recently Completed" section

3. **Stage specific files** (never use `git add .`)
   ```bash
   git add <specific-files>
   ```

4. **Commit with descriptive message**
   ```bash
   git commit -m "type: description"
   ```
   Types: feat, fix, refactor, style, docs, chore

5. **Push to remote**
   ```bash
   git push
   ```

6. **Copy release APK** (if applicable)
   ```bash
   cp android/app/build/outputs/apk/release/app-release.apk <app-name>-release.apk
   ```

## Git Protocol Reminders
- Never amend unless explicitly requested
- Never force push to main/master
- Never skip hooks (--no-verify)
- Create NEW commits after hook failures
