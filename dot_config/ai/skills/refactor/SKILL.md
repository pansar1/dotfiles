---
name: refactor
description: Suggest refactoring improvements for cleaner, more maintainable code. Use when asked to refactor, improve, or clean up code.
---

# Code Refactoring

Identify refactoring opportunities and suggest improvements.

## Refactoring Principles

1. **Make the change easy, then make the easy change**
2. **Leave the code better than you found it**
3. **Small, incremental changes over big rewrites**
4. **Tests first, refactor second**

## Common Refactoring Patterns

### Extract Function
When code does too many things:
```
// Before: one long function
function processOrder(order) {
  // validate
  // calculate
  // save
  // notify
}

// After: clear responsibilities
function processOrder(order) {
  validateOrder(order);
  const total = calculateTotal(order);
  saveOrder(order, total);
  notifyCustomer(order);
}
```

### Extract Variable
When expressions are complex:
```
// Before
if (user.age >= 18 && user.country === 'US' && user.hasVerifiedEmail) {

// After
const isEligible = user.age >= 18 && user.country === 'US' && user.hasVerifiedEmail;
if (isEligible) {
```

### Replace Conditional with Polymorphism
When switch/if chains handle types:
```
// Before
function getArea(shape) {
  switch (shape.type) {
    case 'circle': return Math.PI * shape.radius ** 2;
    case 'square': return shape.side ** 2;
  }
}

// After
class Circle { getArea() { return Math.PI * this.radius ** 2; } }
class Square { getArea() { return this.side ** 2; } }
```

### Replace Magic Numbers
```
// Before
if (password.length < 8) {

// After
const MIN_PASSWORD_LENGTH = 8;
if (password.length < MIN_PASSWORD_LENGTH) {
```

### Guard Clauses
```
// Before
function process(user) {
  if (user) {
    if (user.isActive) {
      // actual logic
    }
  }
}

// After
function process(user) {
  if (!user) return;
  if (!user.isActive) return;
  // actual logic
}
```

## Code Smells to Watch For

- **Long functions** (> 20-30 lines)
- **Deep nesting** (> 3 levels)
- **Long parameter lists** (> 3-4 params)
- **Duplicate code**
- **Feature envy** (function uses another class's data extensively)
- **Data clumps** (same group of variables passed together)
- **Primitive obsession** (using primitives instead of small objects)
- **Comments explaining what** (code should be self-documenting)

## Output Format

For each suggestion:

1. **What**: The code smell or issue
2. **Why**: Why it's problematic
3. **How**: The refactoring technique to apply
4. **Before/After**: Show the transformation

## Safety Checklist

Before refactoring:
- [ ] Tests exist and pass
- [ ] Understand what the code does
- [ ] Small, reversible changes
- [ ] Run tests after each change
