# Global Development Rules

## My Preferences
- Concise responses only - no preambles, greetings, or status updates
- Just show me the code changes
- Don't ask "would you like me to..." - just do it
- Remind me if I skip steps in the workflow protocol

## GPT-5.2 Known Weak Points (Pay Extra Attention)
- **Concurrency issues**: 6x more threading bugs than other models - review all async/await code carefully
- **Scope creep**: Tends to expand tasks - stick strictly to what was asked
- **Verbosity**: May produce more code than needed - keep it minimal

## Core Principles
- Keep solutions simple and focused - only make changes directly requested
- Prefer editing existing files over creating new ones
- Never add features, refactor, or "improve" code beyond what was asked
- Never provide time estimates or predictions
- Keep responses concise - no preambles, status updates, or unnecessary explanations

## Code Quality
- Use TypeScript with strict typing; avoid `any`
- Use functional components with hooks for React/React Native
- No unnecessary comments, docstrings, or type annotations on unchanged code
- Delete unused code completely - no backwards-compatibility hacks
- Validate inputs at system boundaries only (user input, external APIs)

## Output Constraints
- Output minimal code changes only
- Do NOT expand scope beyond the task
- If you notice related issues, mention as optional but don't auto-fix
- No upfront plans or step-by-step outlines unless explicitly requested
- When asked to plan, create a detailed plan before any implementation

## Workflow Protocol
When asked to "follow the workflow protocol":
1. **Plan** - Enter plan mode, create detailed implementation approach
2. **Implement** - Execute phase by phase
3. **Review** - Check pattern consistency, edge cases, theme compatibility
4. **Security** - Validate inputs, parameterized queries, no exposed secrets
5. **Test** - Build and verify before proceeding
6. **Document** - Update TECHNICAL_MANUAL.md and CLAUDE.md
7. **Commit** - Descriptive commit message, push

## Documentation Requirements
After completing any feature, fix, or change:

### TECHNICAL_MANUAL.md
- Update version number and date
- Add entry describing what changed
- Document any new components, hooks, or utilities
- Update configuration or build instructions if affected
- Keep changelog organized by version (newest first)

### CLAUDE.md (or project context file)
- Update "Recently Completed" section with the change
- Add any new patterns or conventions discovered
- Document any gotchas or platform-specific workarounds
- Update file references if new key files were created
- Keep this file current so AI assistants have accurate context

### Documentation Style
- Be concise but complete
- Include code examples for new patterns
- Note any breaking changes or migration steps
- Reference related files with paths

## Terminal Commands
- Run commands sequentially with && chaining when dependent
- Verify command success before proceeding
- Never run destructive git commands without explicit permission
- Stage specific files, not `git add .` or `git add -A`

## React Native / Mobile
- Use TouchableOpacity inside ScrollView (not Pressable on Android)
- Wrap Pressable backgrounds in parent View for Android compatibility
- Always use theme tokens from context for colors
- Test both light and dark mode for every UI change
- Dark mode buttons: #333333 (not white)

## Git Protocol
- Never amend commits unless explicitly requested
- Never force push to main/master
- Never skip hooks (--no-verify)
- Create NEW commits after hook failures, don't amend
- Include descriptive commit messages focused on "why"

## Error Handling
- Handle errors at beginning of functions with early returns
- Avoid deeply nested conditionals
- Only add error handling for realistic scenarios
- Trust internal code and framework guarantees

## Review Checklist (Apply Before Completing)
- [ ] Changes match exactly what was requested
- [ ] No scope creep or unrequested improvements
- [ ] Works in both light and dark mode (if UI)
- [ ] No hardcoded values that should use theme/config
- [ ] Concurrent/async code reviewed for race conditions
- [ ] TECHNICAL_MANUAL.md updated with changes
- [ ] CLAUDE.md updated with new patterns/features
