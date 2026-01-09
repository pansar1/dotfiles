# ============================================================================
# Zoxide Configuration
# Smart directory navigation - "frecency" based cd replacement
# ============================================================================

# Zoxide is initialized in zshrc with: eval "$(zoxide init zsh)"
# This file contains additional configuration and aliases

# ------------------------------
# Environment Variables
# ------------------------------

# Data directory (XDG compliant)
export _ZO_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zoxide"

# Echo the matched directory before navigating
export _ZO_ECHO=1

# Exclude paths from being added to the database
# Add directories you don't want zoxide to track
export _ZO_EXCLUDE_DIRS="${HOME}/.Trash:${HOME}/Library"

# Maximum number of results to show in interactive mode
export _ZO_MAXAGE=10000

# ------------------------------
# Aliases
# ------------------------------

# z   - Jump to directory (already provided by zoxide)
# zi  - Interactive selection (already provided by zoxide)

# Additional helpful aliases
alias zl='zoxide query -l'        # List all tracked directories
alias zr='zoxide remove'          # Remove a path from database
alias ze='zoxide edit'            # Edit database (opens in $EDITOR)

# ------------------------------
# Helper Functions
# ------------------------------

# Jump to a directory and list contents
zd() {
  z "$@" && ls
}

# Jump to a directory and show git status
zg() {
  z "$@" && git status 2>/dev/null || echo "Not a git repository"
}

# Clear zoxide database (use carefully!)
zoxide-clear() {
  echo "⚠️  This will clear your entire zoxide database!"
  echo -n "Are you sure? (yes/no): "
  read answer
  if [[ "$answer" == "yes" ]]; then
    rm -f "${_ZO_DATA_DIR}/db.zo"
    echo "✓ Zoxide database cleared"
  else
    echo "Cancelled"
  fi
}

# Show top 10 most used directories
ztop() {
  zoxide query -l | head -10
}

# ------------------------------
# Tips
# ------------------------------

# Usage:
#   z foo          # cd into highest ranked directory matching foo
#   z foo bar      # cd into highest ranked directory matching foo and bar
#   z ~/foo        # cd into ~/foo (absolute paths work too)
#
#   zi foo         # cd with interactive selection using fzf
#
#   zl             # List all directories in database
#   ztop           # Show top 10 most used directories
#   zr /path       # Remove path from database
#
# Tips:
#   - The more you use a directory, the higher it ranks
#   - Recent directories rank higher than old ones
#   - Use partial names: 'z dot' instead of 'cd ~/.dotfiles'
