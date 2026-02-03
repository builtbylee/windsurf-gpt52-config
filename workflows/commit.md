---
auto_execution_mode: 0
description: Git commit workflow with documentation updates and push to remote
---
Commit changes following the established git protocol.

## Pre-Commit Security Checklist
- [ ] No .env* or secret files are staged (check `git status`)
- [ ] No hardcoded secrets in staged code (API keys, passwords, tokens)
- [ ] git diff output reviewed - if it shows secrets, STOP and unstage those files
- [ ] Commit message contains no secret values

## Pre-Commit Quality Checklist
- [ ] All changes tested and working
- [ ] TECHNICAL_MANUAL.md updated with version and changelog
- [ ] CLAUDE.md updated with new patterns/features

## Steps

1. **Review current state**
   ```bash
   git status
   git diff
   ```
   **WARNING**: If git diff shows contents of .env files or secrets, do NOT display that output. Say "git diff contains sensitive values - reviewing privately" and proceed without showing it.

2. **Verify no sensitive files staged**
   - If .env*, credentials, or secret files appear in staged files: unstage them
   - These files should typically be in .gitignore

3. **Check for dead code**
   - If refactoring removed code that's now unused, list it:
     "These appear to be unused after this change: [list]. Should I remove them?"
   - Don't delete without asking

4. **Update documentation**
   - Add version entry to TECHNICAL_MANUAL.md
   - Update CLAUDE.md "Recently Completed" section

5. **Stage specific files** (never use `git add .`)
   ```bash
   git add <specific-files>
   ```
   Never stage: .env*, *secret*, *credential*, *.pem, *.key

6. **Commit with descriptive message**
   ```bash
   git commit -m "type: description"
   ```
   Types: feat, fix, refactor, style, docs, chore
   NEVER include actual secret values in commit messages.

7. **Provide change summary**
   ```
   CHANGES MADE:
   - [file]: [what and why]

   DIDN'T TOUCH:
   - [file]: [why left alone]

   POTENTIAL CONCERNS:
   - [risks to verify]
   ```

8. **Push to remote**
   ```bash
   git push
   ```

9. **Copy release APK** (if applicable)
   ```bash
   cp android/app/build/outputs/apk/release/app-release.apk <app-name>-release.apk
   ```

## Git Protocol Reminders
- Never amend unless explicitly requested
- Never force push to main/master
- Never skip hooks (--no-verify)
- Create NEW commits after hook failures
