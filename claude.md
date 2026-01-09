# Instructions for Claude: Working with this Dotfiles Repository

## Core Principles

### 1. Small, Incremental Changes
- Make ONE logical change at a time
- Each change should be easy to understand and verify
- Never batch multiple unrelated changes together
- If a task has multiple steps, pause after each step for approval

### 2. Always Explain Before Doing
Before making ANY change, explain:
- **What** you're going to change (specific files/commands)
- **Why** the change is needed (rationale and benefits)
- **How** to verify it worked (commands to run)
- **How** to rollback if needed (undo steps)

### 3. Wait for Explicit Approval
- After explaining a change, WAIT for user approval
- Never assume approval
- If the change involves multiple steps, get approval for each step
- For git commits, always wait for "commit this" or similar explicit approval

### 4. Explain Technical Concepts
- Don't assume user knows all tools/concepts
- Explain what new tools do and why they're better than alternatives
- Use analogies when helpful
- Link concepts to existing knowledge when possible

## Change Workflow

### Step 1: Explain the Change
```
I'm going to [ACTION]:

**What**: [Specific changes to files/commands]

**Why**: [Rationale - what problem this solves or improves]

**How to verify**:
```bash
[Commands user can run to check it worked]
```

**Rollback if needed**:
```bash
[Commands to undo the change]
```

Do you want me to proceed?
```

### Step 2: Wait for Approval
- User will say "yes", "proceed", "do it", or similar
- If user has questions, answer them fully before proceeding
- If user says "no" or "wait", stop and discuss alternatives

### Step 3: Make the Change
- Execute the change as explained
- Show relevant output
- Don't make additional "helpful" changes without asking

### Step 4: Verify Together
- Run verification commands
- Show the output
- Confirm everything worked as expected
- If something failed, explain what happened and suggest fixes

### Step 5: Commit (if applicable)
- Explain what the commit will include
- Show the proposed commit message
- Wait for explicit "commit this" approval
- After commit, show the commit hash and summary

## Git Commit Guidelines

### Format
```
<type>: <short description>

<detailed explanation of what changed and why>
<list specific changes if multiple things changed>

Part of dotfiles modernization (Issue #N)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

### Types
- `feat`: New feature or capability
- `chore`: Maintenance, reorganization, cleanup
- `fix`: Bug fix
- `docs`: Documentation only
- `refactor`: Code restructuring without behavior change

### Always Include
- Clear description of what changed
- Why the change was made (if not obvious)
- Which issue it relates to
- Co-authored-by line

## File Changes

### Before Editing
- Always READ the file first
- Show relevant sections to user
- Explain what you'll change and why
- Get approval before using Edit/Write tools

### When Editing
- Use Edit tool for existing files (prefer over Write)
- Show the exact old_string and new_string
- Explain what the change does
- Keep changes minimal - only what's necessary

### After Editing
- Show how to verify the change worked
- Offer to show the full updated file if helpful
- Check for syntax errors if applicable

## New Tool Additions

When adding a new tool to the dotfiles:

### 1. Introduce the Tool
- Name and purpose
- Why it's better than alternatives or current approach
- Link to documentation/homepage if helpful

### 2. Installation Steps
- Add to Brewfile (explain why in that section)
- Show the brew install command
- Verify it's installed

### 3. Configuration
- Create config file in appropriate topics/ directory
- Explain each configuration option
- Show how to test the config

### 4. Integration
- Update zshrc or other files to source/initialize
- Explain the integration points
- Test that it loads correctly

## Directory Structure

```
~/.dotfiles/
├── topics/              # Modular topic-based configs
│   ├── zsh/            # Shell configs (zshrc, aliases, functions)
│   ├── git/            # Git config and aliases
│   ├── mise/           # Runtime management config
│   ├── starship/       # Prompt config
│   ├── tools/          # bat, zoxide, atuin, fzf configs
│   ├── cloud/          # gcloud, aws, docker setup
│   └── macos/          # macOS-specific settings
│
├── scripts/
│   ├── setup/          # Installation scripts
│   └── utilities/      # Backup and verification scripts
│
├── docs/               # Documentation
│
├── Brewfile            # Package list
├── install.conf.yaml   # Dotbot config
├── claude.md           # This file - instructions for Claude
└── README.md           # User-facing documentation
```

### File Placement Rules
- Configs go in appropriate `topics/` subdirectory
- Scripts go in `scripts/setup/` or `scripts/utilities/`
- Documentation goes in `docs/` or root (for README)
- Never create files in root unless necessary

## Testing and Verification

### After Any Change
- Provide commands to verify the change
- Test in current shell if applicable
- Check for errors or warnings
- Verify no existing functionality broke

### Before Committing
- Run any relevant verification scripts
- Check git status and diff
- Ensure no unintended files are included
- Verify commit message is clear

## Common Scenarios

### Scenario: Adding a new tool
1. Explain the tool and why it's useful
2. Add to Brewfile (with explanation)
3. Install it (brew bundle)
4. Create config in topics/
5. Integrate in zshrc (if needed)
6. Test it works
7. Commit with clear message

### Scenario: Modifying zshrc
1. Show current relevant section
2. Explain what will change and why
3. Show the exact edit
4. Source the new zshrc in current shell
5. Test the change
6. Commit if approved

### Scenario: Creating a new script
1. Explain what the script will do
2. Show the script content
3. Explain each section
4. Save it and make executable
5. Test run it
6. Commit if approved

## What NOT to Do

❌ Don't make changes without explaining first
❌ Don't commit without explicit approval
❌ Don't batch unrelated changes
❌ Don't assume user knowledge - always explain
❌ Don't add "improvements" that weren't asked for
❌ Don't create files in root unless necessary
❌ Don't skip verification steps
❌ Don't force push without explicit request

## Communication Style

- Be clear and concise
- Use markdown formatting for code blocks
- Show commands in copyable format
- Use headers to organize explanations
- Highlight important warnings or notes
- Ask clarifying questions when uncertain

## Current Project Context

This repository is undergoing modernization following these issues:
1. ✅ Backup & Directory Structure Setup
2. ⏳ Update & Organize Brewfile
3. ⏳ Mise Setup & Runtime Migration
4. ⏳ Shell Configuration Modernization
5. ⏳ Modern Tool Integration
6. ⏳ Setup Scripts & Dotbot Configuration
7. ⏳ Documentation
8. ⏳ Testing, Verification & Cleanup

Track progress at: https://github.com/pansar1/dotfiles/issues

## Questions?

When uncertain about anything:
- Ask the user
- Explain the options
- Recommend an approach if appropriate
- Wait for their decision

Remember: The user wants to understand and control all changes. Your job is to be helpful, educational, and transparent.
