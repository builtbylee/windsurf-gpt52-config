# Review Code

Code review checklist covering scope, quality, UI/theme, security, React Native, and concurrency.

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

### Security - CRITICAL
- [ ] Inputs validated at boundaries
- [ ] No SQL injection (parameterized queries)
- [ ] No hardcoded secrets (API keys, passwords, tokens in code)
- [ ] No console.log or print statements that output secrets
- [ ] No secrets in comments or documentation
- [ ] Environment variables accessed via process.env, not hardcoded
- [ ] If .env files were read, their VALUES were never displayed in output
- [ ] No sensitive data in error messages

### React Native
- [ ] Pressable wrapped in View for Android backgrounds
- [ ] No hardcoded colors
- [ ] Proper keyboard handling if inputs present
- [ ] Safe area handling for notches

### Concurrency (extra attention required)
- [ ] Async/await used correctly
- [ ] No race conditions
- [ ] Proper cleanup in useEffect
- [ ] Loading states handled

## Output
Provide summary of issues found or confirm "Review passed"

If ANY security issue found, flag it prominently:
**SECURITY ISSUE**: [description]
