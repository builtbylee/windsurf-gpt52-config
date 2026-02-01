# GPT-5.2 Optimization Kit

A comprehensive configuration kit that optimizes AI-powered IDEs for GPT-5.2, bringing Claude Code-level capabilities to your development workflow.

## Supported IDEs

| IDE | Support Level | Features |
|-----|---------------|----------|
| **Windsurf** | Full | Rules + Skills + Workflows |
| **Cursor** | Partial | Rules only (.cursorrules) |
| **VS Code + Copilot** | Partial | Instructions file |
| **Other IDEs** | Basic | Copy rules manually |

## Why This Exists

GPT-5.2 is powerful but has known weaknesses compared to Claude Opus 4.5:
- **Concurrency issues**: 6x more threading bugs than other models
- **Scope creep**: Tends to expand beyond requested tasks
- **Verbosity**: Produces more code than necessary

This configuration compensates for these weaknesses with explicit rules, structured workflows, and reusable skills.

## What's Included

```
gpt52-optimization-kit/
├── global_rules.md           # Universal rules (works in any IDE)
├── cursor/
│   └── .cursorrules          # Cursor-specific format
├── vscode/
│   └── .github-copilot-instructions
├── skills/                   # Windsurf only
│   ├── build-android/
│   ├── commit-changes/
│   ├── plan-mode/
│   ├── review-code/
│   ├── update-docs/
│   ├── workflow-full/
│   └── workflow-quick/
├── workflows/                # Windsurf only
│   ├── build.md
│   ├── commit.md
│   ├── quick-fix.md
│   ├── review.md
│   └── workflow-protocol.md
├── templates/
│   ├── CLAUDE.md             # Project context template
│   └── TECHNICAL_MANUAL.md   # Documentation template
└── scripts/
    ├── install.sh            # Windsurf installer
    ├── uninstall.sh          # Windsurf uninstaller
    └── install-cursor.sh     # Cursor installer
```

---

## Quick Install

### Windsurf (Full Support)

```bash
git clone https://github.com/builtbylee/windsurf-gpt52-config.git
cd windsurf-gpt52-config
./scripts/install.sh
```

Then restart Windsurf.

---

## Choosing the Right GPT-5.2 Model

Windsurf offers many GPT-5.2 variants. Here's how to choose:

### Model Types

| Model | Best For | Behavior |
|-------|----------|----------|
| **GPT 5.2 Codex** | Coding tasks | Action-oriented, faster completion |
| **GPT 5.2** (general) | Complex reasoning | Thinks deeper, may run longer |

### Reasoning Levels

| Level | Speed | Credits | Use For |
|-------|-------|---------|---------|
| **None/Low** | Instant | 1 | Simple queries (not recommended for coding) |
| **Medium** | 30-90 sec | 2 | Quick fixes, simple changes |
| **High** | 3-10 min | 3 | Features, refactors, most tasks |
| **xHigh** | 10-30+ min | 6-8 | PhD-level problems (rarely needed) |

### Standard vs Fast

| Variant | Credits | When to Use |
|---------|---------|-------------|
| **Standard** | 1x | Default - sufficient for most work |
| **Fast** | 2x | Parallel tasks, impatience |

### Recommended Models (3 to Use Daily)

| Model | Credits | Use For | % of Work |
|-------|---------|---------|-----------|
| **GPT 5.2 Codex High** | 3 | Primary - features, UI, bugs, refactors | 80% |
| **GPT 5.2 Codex Medium** | 2 | Quick fixes, typos, simple styling | 15% |
| **GPT 5.2 High** | 3 | When stuck, architecture, deep debugging | 5% |

### Quick Reference

| Task | Model |
|------|-------|
| "Add a button" | Codex High |
| "Fix this typo" | Codex Medium |
| "Refactor authentication" | Codex High |
| "Why isn't this working?" | GPT 5.2 High |
| "Follow workflow protocol" | Codex High |

### Models to Avoid

- **xHigh** - Overkill, 3x slower, 3x credits
- **Fast variants** - 2x cost, rarely needed
- **Low/None** - May miss issues

---

### Cursor

```bash
git clone https://github.com/builtbylee/windsurf-gpt52-config.git
cd windsurf-gpt52-config
./scripts/install-cursor.sh
```

Or manually copy `cursor/.cursorrules` to your project root.

### VS Code + GitHub Copilot

Copy `vscode/.github-copilot-instructions` to your project root.

### Other IDEs

Copy the content from `global_rules.md` into your IDE's AI instructions/rules configuration.

---

## Windsurf Usage

### Workflows (Slash Commands)

| Command | When to Use |
|---------|-------------|
| `/workflow-protocol` | Full 7-phase workflow for features |
| `/quick-fix` | Simple, obvious fixes |
| `/build` | Build APK and deploy to device |
| `/commit` | Git commit with docs update |
| `/review` | Code review checklist |

### Skills (@ Mentions)

| Skill | Description |
|-------|-------------|
| `@build-android` | Build and install APK |
| `@commit-changes` | Git commit workflow |
| `@plan-mode` | Create implementation plan |
| `@review-code` | Run review checklist |
| `@update-docs` | Update documentation files |
| `@workflow-full` | Complete 7-phase protocol |
| `@workflow-quick` | Lightweight workflow |

### Natural Language

| Say This | Triggers |
|----------|----------|
| "follow the workflow protocol" | Full workflow |
| "build" or "test on device" | Build skill |
| "commit" or "push" | Commit workflow |
| "review the code" | Code review |

---

## The Workflow Protocol

When you say "follow the workflow protocol":

1. **Plan** - Create detailed implementation plan, wait for approval
2. **Implement** - Execute phase by phase
3. **Review** - Code review checklist, theme compatibility
4. **Security** - Validate inputs, check for vulnerabilities
5. **Test** - Build and verify on device
6. **Document** - Update TECHNICAL_MANUAL.md and CLAUDE.md
7. **Commit** - Stage specific files, descriptive message, push

---

## Project Documentation Templates

This kit includes templates for two recommended documentation files:

### CLAUDE.md
Project context file for AI assistants. Copy from `templates/CLAUDE.md`.

### TECHNICAL_MANUAL.md
Full project documentation. Copy from `templates/TECHNICAL_MANUAL.md`.

---

## Global Rules Summary

### GPT-5.2 Weak Point Mitigations
- **Concurrency**: Extra review on async/await code
- **Scope creep**: Strict "only what was asked" constraint
- **Verbosity**: "Minimal code changes only" instruction

### Core Principles
- Keep solutions simple
- Prefer editing existing files
- Never expand scope
- No time estimates

### Code Quality
- TypeScript strict typing
- Functional components
- Early returns
- Delete unused code

### React Native / Mobile
- TouchableOpacity in ScrollView
- Theme tokens for colors
- Light/dark mode testing
- Dark buttons: #333333

### Git Protocol
- Never amend unless asked
- Never force push
- Stage specific files
- Descriptive messages

---

## IDE Feature Comparison

| Feature | Windsurf | Cursor | VS Code |
|---------|----------|--------|---------|
| Global Rules | ✓ | ✓ | ✓ |
| Skills (@mentions) | ✓ | ✗ | ✗ |
| Workflows (/commands) | ✓ | ✗ | ✗ |
| Auto-invocation | ✓ | ✗ | ✗ |
| Natural language triggers | ✓ | Partial | Partial |

---

## Customization

### Adding Windsurf Skills

1. Create folder: `~/.codeium/windsurf/skills/my-skill/`
2. Create `SKILL.md`:

```markdown
---
name: my-skill
description: Brief description
---

## Instructions
[Your skill content]
```

3. Restart Windsurf

### Adding Windsurf Workflows

1. Create file: `~/.codeium/windsurf/windsurf/workflows/my-workflow.md`
2. Add content:

```markdown
---
auto_execution_mode: 0
description: Brief description
---

[Your workflow steps]
```

3. Restart Windsurf

---

## Troubleshooting

### Skills/Workflows Not Appearing (Windsurf)
- Restart Windsurf
- Check file is named `SKILL.md` (case-sensitive)
- Verify frontmatter format

### Rules Not Being Followed
- Be explicit: "following the global rules..."
- Check for conflicting memories
- Simplify complex rules

---

## Benchmark Context

| Aspect | GPT-5.2 | Claude Opus 4.5 |
|--------|---------|-----------------|
| SWE-bench | 80.0% | **80.9%** |
| Terminal-Bench | 47.6% | **59.3%** |
| ARC-AGI-2 | **52.9%** | 37.6% |
| Math (AIME) | **100%** | 92.8% |
| Concurrency bugs/MLOC | 470 | ~80 |

This configuration compensates for GPT-5.2's weaknesses while leveraging its strengths.

---

## Contributing

PRs welcome! Please test with GPT-5.2 before submitting.

## License

MIT License

## Credits

Developed with Claude Code (Opus 4.5) and Windsurf (GPT-5.2).

Sources:
- [OpenAI GPT-5.2](https://openai.com/index/introducing-gpt-5-2/)
- [Sonar Code Quality](https://www.sonarsource.com/blog/new-data-on-code-quality-gpt-5-2-high-opus-4-5-gemini-3-and-more/)
- [Windsurf Docs](https://docs.windsurf.com/)
