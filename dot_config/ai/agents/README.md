# AI Agents

Custom subagents that work across different AI coding assistants. Each agent is a specialized assistant with its own system prompt, tool access, and focus.

## Structure

Each agent is a markdown file with YAML frontmatter:

```
agents/
├── teacher.md      # Educational mode - explains while coding
├── reviewer.md     # Code review specialist
└── architect.md    # System design and planning
```

## Available Agents

| Agent | Description | Best For |
|-------|-------------|----------|
| `teacher` | Explains concepts while coding, asks questions, teaches patterns | Learning, hobby projects |
| `reviewer` | Thorough code review with security focus | Pre-commit, PR reviews |
| `architect` | System design and architectural decisions | Planning, new features |

## Usage

### Claude Code
Agents are synced to `~/.claude/agents/` and available automatically.
Claude delegates to them based on task or you can request explicitly:
```
Use the teacher agent to help me build this feature
```

### Cursor
Copy agents to `.cursor/agents/` or adapt for Cursor's format.

### Other AI Tools
Reference the agent prompts in your tool's configuration.

## Sync

Agents are automatically synced by the chezmoi post-install script.
Run `chezmoi apply` to sync changes.
