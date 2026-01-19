# MCP Server Configuration

This directory contains shared MCP (Model Context Protocol) server configurations used across multiple AI coding assistants.

## Files

- **servers.json** - Main MCP server definitions (synced across machines)
- **servers.local.json** - Machine-specific MCP servers (ignored by git, optional)

## How It Works

The `servers.json` file serves as the single source of truth for MCP servers. A chezmoi post-install script (`run_onchange_after_sync-ai-configs.sh.tmpl`) automatically syncs these configurations to tool-specific locations:

### Supported Tools

| Tool | Config Location | Format |
|------|----------------|--------|
| **Claude Code** | `~/.claude.json` | Merged into existing `mcpServers` section |
| **Cursor** | `~/.cursor/mcp.json` | Direct copy |
| **Cline** | `~/Library/Application Support/Code/.../cline_mcp_settings.json` | Direct copy |
| **VS Code Copilot** | `~/Library/Application Support/Code/User/mcp.json` | Transformed to `"servers"` format |

## Adding a New MCP Server

1. Edit `servers.json` and add your server:
   ```json
   {
     "mcpServers": {
       "my-server": {
         "command": "npx",
         "args": ["-y", "@modelcontextprotocol/server-package-name"]
       }
     }
   }
   ```

2. Run `chezmoi apply` to sync to all tools

3. Restart your AI coding assistant to load the new server

## Environment Variables & Secrets

For servers requiring API keys or secrets, use environment variables:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

Set the environment variable in your shell profile:
```bash
export GITHUB_TOKEN="your-token-here"
```

## Machine-Specific Servers

For servers you only want on specific machines, create `servers.local.json.tmpl` (this file is ignored by git).

## Available MCP Servers

Popular MCP servers you can add:
- `@modelcontextprotocol/server-filesystem` - File system access
- `@modelcontextprotocol/server-github` - GitHub integration
- `@modelcontextprotocol/server-sequential-thinking` - Enhanced reasoning
- `@modelcontextprotocol/server-brave-search` - Web search
- `@modelcontextprotocol/server-sqlite` - Database access
- `@modelcontextprotocol/server-postgres` - PostgreSQL access

Find more at: https://github.com/modelcontextprotocol/servers
