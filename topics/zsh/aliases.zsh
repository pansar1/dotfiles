# ============================================================================
# ZSH Aliases
# ============================================================================

# ------------------------------
# Modern CLI Tool Replacements
# ------------------------------

# Use eza instead of ls (modern, colorful, git-aware)
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza --icons --group-directories-first -l'
  alias la='eza --icons --group-directories-first -la'
  alias lt='eza --icons --group-directories-first --tree --level=2'
  alias lta='eza --icons --group-directories-first --tree --level=2 -a'
fi

# Use bat instead of cat (syntax highlighting)
if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
  alias bcat='bat'  # bat with pager
fi

# Use trash instead of rm (safety first!)
if command -v trash >/dev/null 2>&1; then
  alias rm='trash'
  alias rmd='trash'  # explicit trash alias
  alias rmf='/bin/rm'  # force real rm if needed (use carefully!)
fi

# ------------------------------
# Homebrew
# ------------------------------

alias bbd='brew bundle dump --force --describe'
alias bbu='brew update && brew upgrade && brew cleanup'
alias bbc='brew cleanup'

# ------------------------------
# Git Aliases
# ------------------------------

# Navigation
alias g='git'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gds='git diff --staged'

# Branch management
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gmain='git checkout main'
alias gmaster='git checkout master'
alias goutm='git checkout master'  # legacy alias

# Commits
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'

# Push/Pull (with fun aliases!)
alias yoink='git pull'
alias yeet='git push'
alias gpu='git push'
alias gpl='git pull'
alias gp='git push'

# Stash
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

# Logs
alias glo='git log --oneline'
alias glg='git log --graph --oneline --decorate --all'

# ------------------------------
# GitHub CLI
# ------------------------------

if command -v gh >/dev/null 2>&1; then
  alias ghco='gh pr checkout'
  alias ghpr='gh pr create -f'
  alias ghpv='gh pr view -w'
  alias ghcl='gh repo clone'
  alias ghv='gh repo view -w'
  alias ghi='gh issue list'
fi

# ------------------------------
# Directory Navigation
# ------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias doc='cd ~/Documents'

# Use zoxide for smart cd (if available, configured in tools/zoxide.zsh)
# Usage: z <partial-path>

# ------------------------------
# Utilities
# ------------------------------

# Show PATH entries one per line
alias trail='<<<${(F)path}'
alias path='echo $PATH | tr ":" "\n"'

# Disk usage
alias duf='du -sh * | sort -hr'
alias disk='df -h'

# IP addresses (myip is a function in functions.zsh)
alias localip='ipconfig getifaddr en0'

# Clear screen
alias c='clear'

# Reload shell
alias reload='exec zsh'

# ------------------------------
# Development
# ------------------------------

# npm
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nrs='npm run start'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrt='npm run test'

# yarn
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add --dev'
alias ys='yarn start'
alias yd='yarn dev'
alias yb='yarn build'
alias yt='yarn test'

# Docker
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias dcl='docker compose logs'
alias dps='docker ps'
alias dpsa='docker ps -a'

# ------------------------------
# Misc
# ------------------------------

# Edit this file
alias aliases='${EDITOR:-code} ~/.dotfiles/topics/zsh/aliases.zsh'

# Quick edits
alias zshrc='${EDITOR:-code} ~/.dotfiles/topics/zsh/zshrc'
alias hosts='sudo ${EDITOR:-nano} /etc/hosts'
