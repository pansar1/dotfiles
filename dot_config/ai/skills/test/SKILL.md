---
name: test
description: Generate unit tests for code. Use when asked to write tests, add test coverage, or test a function.
---

# Test Generator

Generate comprehensive unit tests following best practices.

## Test Structure

Use the Arrange-Act-Assert (AAA) pattern:

```
describe('functionName', () => {
  it('should [expected behavior] when [condition]', () => {
    // Arrange - set up test data and mocks
    const input = createTestInput();
    
    // Act - call the function under test
    const result = functionName(input);
    
    // Assert - verify the result
    expect(result).toBe(expectedValue);
  });
});
```

## What to Test

### Happy Path
- Normal expected inputs
- Valid edge values (min, max, empty)

### Edge Cases
- Empty inputs (null, undefined, [], {}, '')
- Boundary values (0, -1, MAX_INT)
- Single item collections
- Unicode and special characters

### Error Cases
- Invalid inputs that should throw
- Missing required parameters
- Type mismatches

### Async Behavior
- Successful async operations
- Failed async operations
- Timeout scenarios
- Concurrent operations

## Naming Convention

```
it('should [do something] when [condition]')

// Examples:
it('should return empty array when input is empty')
it('should throw ValidationError when email is invalid')
it('should call API once when cache is empty')
```

## Mocking Guidelines

1. Mock external dependencies (APIs, databases, file system)
2. Don't mock the code under test
3. Prefer dependency injection over global mocks
4. Reset mocks between tests

## Test Organization

```
describe('UserService', () => {
  describe('createUser', () => {
    describe('with valid input', () => {
      it('should create user in database', () => {});
      it('should return the created user', () => {});
      it('should send welcome email', () => {});
    });
    
    describe('with invalid input', () => {
      it('should throw when email is missing', () => {});
      it('should throw when email is invalid', () => {});
    });
  });
});
```

## Coverage Goals

- Aim for meaningful coverage, not 100%
- Cover all branches and conditions
- Test public API, not implementation details
- Integration tests for complex interactions
