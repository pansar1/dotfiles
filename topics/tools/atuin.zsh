# ============================================================================
# Atuin Configuration
# Magical shell history with full-text search and sync
# ============================================================================

# Atuin is initialized in zshrc with: eval "$(atuin init zsh)"
# This file contains additional configuration and aliases

# ------------------------------
# Environment Variables
# ------------------------------

# Disable automatic shell history syncing (sync manually if you want)
export ATUIN_NOBIND="false"

# ------------------------------
# Keybindings
# ------------------------------

# Atuin's default keybinding for search is Ctrl+R
# The initialization in zshrc sets this up automatically
# Additional custom keybindings can be added here if needed

# Up arrow for inline history search (if not using history-substring-search)
# bindkey '^[[A' _atuin_search_widget

# ------------------------------
# Aliases
# ------------------------------

# Quick access to atuin commands
alias ah='atuin history'           # View history
alias ahs='atuin history list'     # List history entries
alias as='atuin search'            # Search history
alias ast='atuin stats'            # Show statistics
alias asu='atuin sync'             # Sync history (if configured)
alias ai='atuin import'            # Import history from other shells

# ------------------------------
# Helper Functions
# ------------------------------

# Show today's command statistics
atuin-today() {
  echo "=== Commands run today ==="
  atuin stats today
}

# Show most used commands
atuin-top() {
  local limit=${1:-10}
  echo "=== Top $limit commands ==="
  atuin stats | head -n $((limit + 1))
}

# Search history by directory
atuin-here() {
  atuin search --cwd "$(pwd)"
}

# Search history excluding current directory
atuin-elsewhere() {
  atuin search --exclude-cwd "$(pwd)"
}

# Show history for a specific command
atuin-cmd() {
  if [ -z "$1" ]; then
    echo "Usage: atuin-cmd <command>"
    return 1
  fi
  atuin search "$1"
}

# Show failed commands
atuin-failed() {
  atuin search --exit 1
}

# Show successful commands
atuin-success() {
  atuin search --exit 0
}

# Clear atuin cache (use carefully!)
atuin-clear-cache() {
  echo "⚠️  This will clear atuin's local cache!"
  echo -n "Are you sure? (yes/no): "
  read answer
  if [[ "$answer" == "yes" ]]; then
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/atuin"
    echo "✓ Atuin cache cleared"
    echo "Note: Your history is still on the server if you use sync"
  else
    echo "Cancelled"
  fi
}

# ------------------------------
# Tips
# ------------------------------

# Usage:
#   Ctrl+R         # Open atuin search (fuzzy search through all history)
#   atuin search   # Search with various filters
#   atuin stats    # Show command statistics
#   atuin sync     # Sync history across machines (if configured)
#
# Filters:
#   --cwd          # Commands run in current directory
#   --exclude-cwd  # Commands run elsewhere
#   --exit 0       # Successful commands
#   --exit 1       # Failed commands
#   --before       # Commands before a date
#   --after        # Commands after a date
#
# Tips:
#   - Atuin automatically filters out secrets (API keys, tokens, etc.)
#   - History is stored locally in ~/.local/share/atuin/
#   - Configure sync in ~/.config/atuin/config.toml
#   - Use 'atuin import auto' to import existing shell history

# ------------------------------
# Atuin Config File
# ------------------------------

# Atuin's main configuration is at: ~/.config/atuin/config.toml
# You can customize:
#   - Search modes (fuzzy, exact, prefix)
#   - Key bindings
#   - Sync settings
#   - Filter patterns
#   - UI preferences
#
# Create the config file with: atuin init
# Or edit manually: $EDITOR ~/.config/atuin/config.toml
