---
auto_execution_mode: 0
description: Code review checklist covering scope, quality, UI/theme, security, and concurrency
---
You are performing a thorough code review using the established review checklist.

## Review Checklist

### Scope
- [ ] Changes match exactly what was requested
- [ ] No scope creep or unrequested improvements
- [ ] No new files created unnecessarily

### Code Quality
- [ ] TypeScript types are correct (no `any`)
- [ ] No unused imports or variables
- [ ] Early returns for error handling
- [ ] No deeply nested conditionals

### UI/Theme
- [ ] Uses theme tokens from useTheme()
- [ ] Works in light mode
- [ ] Works in dark mode
- [ ] Dark mode buttons use #333333, not white
- [ ] TouchableOpacity used inside ScrollView (Android)

### Security
- [ ] Inputs validated at boundaries
- [ ] No SQL injection (parameterized queries)
- [ ] No sensitive data exposed
- [ ] No hardcoded secrets
- [ ] No .env*, credentials, or secret files accessed during exploration

### React Native
- [ ] Pressable wrapped in View for Android backgrounds
- [ ] No hardcoded colors
- [ ] Proper keyboard handling if inputs present
- [ ] Safe area handling for notches

### Concurrency (GPT-5.2 weak point - extra attention)
- [ ] Async/await used correctly
- [ ] No race conditions
- [ ] Proper cleanup in useEffect
- [ ] Loading states handled

## Instructions
1. Review all changed files against this checklist
2. Report any issues found with file paths and line numbers
3. If all checks pass, confirm "Review passed ✓"
4. Do NOT fix issues automatically - just report them
