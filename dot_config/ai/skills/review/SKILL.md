---
name: review
description: Review code for bugs, security issues, and improvements. Use when asked to review code, a PR, or check for issues.
---

# Code Review

Perform a thorough code review focusing on correctness, security, and maintainability.

## Review Checklist

### Correctness
- [ ] Logic errors or edge cases not handled
- [ ] Off-by-one errors
- [ ] Null/undefined handling
- [ ] Race conditions in async code
- [ ] Resource leaks (connections, file handles, memory)

### Security
- [ ] Input validation and sanitization
- [ ] SQL injection vulnerabilities
- [ ] XSS vulnerabilities
- [ ] Sensitive data exposure (logs, errors, responses)
- [ ] Authentication/authorization issues
- [ ] Insecure dependencies

### Performance
- [ ] N+1 queries
- [ ] Unnecessary re-renders or computations
- [ ] Missing indexes for database queries
- [ ] Large payload sizes
- [ ] Missing caching opportunities

### Maintainability
- [ ] Code clarity and readability
- [ ] Function/variable naming
- [ ] Code duplication
- [ ] Overly complex logic that could be simplified
- [ ] Missing error handling

## Output Format

For each issue found:

```
## [SEVERITY] Category: Brief Title

**File:** `path/to/file.ts:42`

**Issue:** Clear description of the problem

**Suggestion:** How to fix it

**Example:**
```code
// Before
problematicCode()

// After  
improvedCode()
```
```

Severity levels:
- **CRITICAL**: Security vulnerability or data loss risk
- **HIGH**: Bug that will cause incorrect behavior
- **MEDIUM**: Code smell or maintainability issue
- **LOW**: Style or minor improvement

## Summary

End with a summary:
- Total issues by severity
- Overall assessment (approve, request changes, needs discussion)
- Positive observations (good patterns, well-tested code, etc.)
