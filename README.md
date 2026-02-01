# Windsurf GPT-5.2 Optimization Kit

A comprehensive configuration kit that optimizes Windsurf IDE for GPT-5.2, bringing Claude Code-level capabilities to your development workflow.

## Why This Exists

GPT-5.2 is powerful but has known weaknesses compared to Claude Opus 4.5:
- **Concurrency issues**: 6x more threading bugs than other models
- **Scope creep**: Tends to expand beyond requested tasks
- **Verbosity**: Produces more code than necessary

This configuration kit compensates for these weaknesses with explicit rules, structured workflows, and reusable skills.

## What's Included

| Component | Description |
|-----------|-------------|
| **Global Rules** | Behavioral constraints and coding standards |
| **7 Skills** | Reusable capabilities invoked with `@skill-name` |
| **5 Workflows** | Multi-step processes invoked with `/workflow-name` |
| **Install Script** | One-click installation |

## Quick Install

```bash
git clone https://github.com/builtbylee/windsurf-config.git
cd windsurf-config
./scripts/install.sh
```

Then restart Windsurf.

## Manual Install

1. Copy `global_rules.md` to `~/.codeium/windsurf/memories/`
2. Copy `skills/*/` folders to `~/.codeium/windsurf/skills/`
3. Copy `workflows/*.md` to `~/.codeium/windsurf/windsurf/workflows/`
4. Restart Windsurf

---

## How to Use

### Workflows (Slash Commands)

| Command | When to Use |
|---------|-------------|
| `/workflow-protocol` | Full 7-phase workflow for features and significant changes |
| `/quick-fix` | Simple, obvious fixes (typos, small tweaks) |
| `/build` | Build APK and deploy to Android device |
| `/commit` | Git commit with documentation updates |
| `/review` | Code review against the checklist |

**Example:**
```
/workflow-protocol Add a logout button to the settings screen
```

### Skills (@ Mentions)

| Skill | Description |
|-------|-------------|
| `@build-android` | Build and install APK on device |
| `@commit-changes` | Git commit workflow |
| `@plan-mode` | Create detailed implementation plan |
| `@review-code` | Run code review checklist |
| `@update-docs` | Update TECHNICAL_MANUAL.md and CLAUDE.md |
| `@workflow-full` | Complete 7-phase protocol |
| `@workflow-quick` | Lightweight workflow |

**Example:**
```
@plan-mode I need to add user authentication
```

### Natural Language Triggers

The rules are configured to recognize natural phrases:

| Say This | Triggers |
|----------|----------|
| "follow the workflow protocol" | Full 7-phase workflow |
| "build" or "test on device" | Build skill |
| "commit" or "push" | Commit workflow |
| "review the code" | Code review |
| "quick fix" | Quick workflow |

---

## The Workflow Protocol

When you say "follow the workflow protocol" or use `/workflow-protocol`, Cascade executes:

### Phase 1: Plan
- Read relevant files
- Create detailed implementation plan
- Wait for your approval before coding

### Phase 2: Implement
- Execute plan phase by phase
- Show changes as they're made

### Phase 3: Review
- Run code review checklist
- Check theme compatibility (light/dark mode)
- Extra attention on async/concurrent code

### Phase 4: Security
- Validate inputs
- Check for SQL injection, exposed secrets
- Verify default values

### Phase 5: Test
- Build the app
- Install on device
- Wait for your confirmation

### Phase 6: Document
- Update TECHNICAL_MANUAL.md with version/changelog
- Update CLAUDE.md with new patterns

### Phase 7: Commit
- Stage specific files
- Commit with descriptive message
- Push to remote

---

## Global Rules Reference

### Core Principles
- Keep solutions simple - only make requested changes
- Prefer editing existing files over creating new ones
- Never expand scope beyond the task
- No time estimates

### Code Quality
- TypeScript with strict typing (no `any`)
- Functional components with hooks
- Early returns for error handling
- Delete unused code completely

### React Native / Mobile
- Use `TouchableOpacity` inside `ScrollView` (not `Pressable` on Android)
- Wrap `Pressable` backgrounds in parent `View`
- Always use theme tokens for colors
- Test both light and dark mode
- Dark mode buttons: `#333333` (not white)

### Git Protocol
- Never amend unless explicitly requested
- Never force push to main/master
- Stage specific files (not `git add .`)
- Descriptive commit messages focused on "why"

### Documentation
After every change:
1. Update `TECHNICAL_MANUAL.md` with version and changelog
2. Update `CLAUDE.md` with new patterns/features

---

## Project Documentation Files

This configuration expects two documentation files in your project:

### CLAUDE.md
Project context file for AI assistants. Include:
- Project overview
- Tech stack
- Key files and their purposes
- Important patterns and conventions
- Recently completed work

### TECHNICAL_MANUAL.md
Full project documentation with:
- Version history and changelog
- Architecture documentation
- Build and deployment instructions
- API documentation

---

## Customization

### Adding New Skills

1. Create folder: `~/.codeium/windsurf/skills/my-skill/`
2. Create `SKILL.md` with frontmatter:

```markdown
---
name: my-skill
description: Brief description for Cascade to understand when to invoke
---

## Instructions

[Your skill content here]
```

3. Restart Windsurf
4. Invoke with `@my-skill`

### Adding New Workflows

1. Create file: `~/.codeium/windsurf/windsurf/workflows/my-workflow.md`
2. Add frontmatter:

```markdown
---
auto_execution_mode: 0
description: Brief description shown in workflow list
---

[Your workflow steps here]
```

3. Restart Windsurf
4. Invoke with `/my-workflow`

### Modifying Global Rules

Edit `~/.codeium/windsurf/memories/global_rules.md`

Rules are processed as markdown, so use:
- Bullet points for lists
- Headers for sections
- Code blocks for examples

---

## Troubleshooting

### Skills/Workflows Not Appearing
- Restart Windsurf after adding files
- Check file is named exactly `SKILL.md` (case-sensitive)
- Verify frontmatter has `name` and `description`

### Cascade Not Following Rules
- Rules may conflict with memories - review Memories tab
- Be explicit in your prompts: "following the global rules..."
- Check for typos in rule file

### Build Failing
- Run `npx tsc --noEmit` to check TypeScript errors
- Verify device connected: `adb devices`
- Check gradle: `cd android && ./gradlew clean`

---

## Comparison: GPT-5.2 vs Claude Opus 4.5

| Aspect | GPT-5.2 | Claude Opus 4.5 |
|--------|---------|-----------------|
| SWE-bench Verified | 80.0% | **80.9%** |
| Terminal-Bench | 47.6% | **59.3%** |
| ARC-AGI-2 (Reasoning) | **52.9%** | 37.6% |
| AIME 2025 (Math) | **100%** | 92.8% |
| Security Issues/MLOC | **16** | ~25 |
| Concurrency Issues/MLOC | 470 | ~80 |

This configuration compensates for GPT-5.2's weaknesses (concurrency, scope creep) while leveraging its strengths (security, reasoning).

---

## Contributing

PRs welcome! Please:
1. Test changes with GPT-5.2 in Windsurf
2. Verify both light and dark mode (for UI-related rules)
3. Update this README if adding new skills/workflows

---

## License

MIT License - Use freely, modify as needed.

---

## Credits

Configuration developed through iterative testing with Claude Code (Opus 4.5) and Windsurf (GPT-5.2).

Benchmark data sourced from:
- [OpenAI GPT-5.2 Benchmarks](https://openai.com/index/introducing-gpt-5-2/)
- [Sonar Code Quality Analysis](https://www.sonarsource.com/blog/new-data-on-code-quality-gpt-5-2-high-opus-4-5-gemini-3-and-more/)
- [Windsurf Documentation](https://docs.windsurf.com/)
