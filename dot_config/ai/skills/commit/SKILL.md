---
name: commit
description: Generate a conventional commit message for staged changes. Use when committing code or when asked to create a commit message.
disable-model-invocation: true
---

# Commit Message Generator

Generate a commit message following the Conventional Commits specification.

## Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

## Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, missing semicolons, etc (no code change)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: Performance improvement
- `test`: Adding or updating tests
- `chore`: Build process, dependencies, or tooling changes
- `ci`: CI configuration changes

## Rules

1. Use imperative mood in the description ("add" not "added")
2. Don't capitalize the first letter of the description
3. No period at the end of the description
4. Keep the first line under 72 characters
5. Scope is optional but encouraged for clarity

## Process

1. Run `git diff --staged` to see what's being committed
2. Analyze the changes to determine:
   - The primary type of change
   - The scope (file, module, or feature area)
   - A concise description of what changed
3. If changes span multiple concerns, consider whether they should be separate commits
4. Generate the commit message
5. Show the message and ask for confirmation before committing

## Examples

```
feat(auth): add OAuth2 login support

fix(api): handle null response from user endpoint

refactor(utils): extract date formatting into helper

chore(deps): update typescript to 5.3

docs(readme): add installation instructions
```
