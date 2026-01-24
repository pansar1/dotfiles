# AI Skills

Model-agnostic skills that work across different AI coding assistants. These follow the [Agent Skills](https://agentskills.io) open standard.

## Structure

Each skill is a directory with a `SKILL.md` file:

```
skills/
├── commit/
│   └── SKILL.md
├── review/
│   └── SKILL.md
└── explain/
    └── SKILL.md
```

## Available Skills

| Skill | Description | Invoke |
|-------|-------------|--------|
| `commit` | Generate conventional commit messages | `/commit` |
| `review` | Code review for bugs, security, performance | `/review` |
| `explain` | Explain code with analogies and diagrams | `/explain` |
| `test` | Generate unit tests | `/test` |
| `refactor` | Suggest refactoring improvements | `/refactor` |

## Usage

### Claude Code
Skills are synced to `~/.claude/skills/` and available as slash commands.

### Cursor
Copy skills to `.cursor/skills/` or reference in `.cursorrules`.

### Other AI Tools
Reference the SKILL.md content in your tool's instruction format.

## Sync

Skills are automatically synced by the chezmoi post-install script.
Run `chezmoi apply` to sync changes.
