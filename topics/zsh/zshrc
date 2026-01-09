# Source google-cloud-sdk (guarded)
if [ -s "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then
  source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
fi
if [ -s "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# Set variables
# Syntax highlighting for man pages (only if bat is available)
export HOMEBREW_CASK_OPTS="--no-quarantine"
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export NULLCMD=bat
else
  export MANPAGER="less -R"
  export NULLCMD=cat
fi
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
# Avoid subshell to `brew` here; use fixed Homebrew path
export ZPLUG_HOME="/opt/homebrew/opt/zplug"

# Create Aliases
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'
alias rm='trash'
alias goutm='git checkout master'
alias gmain='git checkout main'
alias yoink="git pull"
alias yeet="git push"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias gpu="g pu"
alias gl="g l"
alias gs="g s"

# PATH additions (ensure Homebrew first, then your tools)
case ":$PATH:" in
  *":/opt/homebrew/bin:"*) ;;
  *) export PATH="/opt/homebrew/bin:$PATH" ;;
esac
case ":$PATH:" in
  *":/opt/homebrew/sbin:"*) ;;
  *) export PATH="/opt/homebrew/sbin:$PATH" ;;
esac

case ":$PATH:" in
  *":$N_PREFIX/bin:"*) ;;
  *) export PATH="$N_PREFIX/bin:$PATH" ;;
esac

case ":$PATH:" in
  *":/Applications/Visual Studio Code.app/Contents/Resources/app/bin:"*) ;;
  *) export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ;;
esac

# Write Handy Functions
function mkcd() {
 mkdir -p "$@" && cd "$_";
}

# Improve autosuggestions visibility before loading plugin
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6b7280"

# Plugins (guarded)
if [ -s "$ZPLUG_HOME/init.zsh" ]; then
  source "$ZPLUG_HOME/init.zsh"
  if command -v zplug >/dev/null 2>&1; then
  zplug "plugins/git",   from:oh-my-zsh
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-history-substring-search"
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "b4b4r07/enhancd"
    zplug "junegunn/fzf"
    zplug "g-plane/zsh-yarn-autocompletions"
    zplug 'dracula/zsh', as:theme

    # Ensure plugins are installed and loaded
    if ! zplug check --verbose; then
      zplug install
    fi
    zplug load

    # Bind Ctrl-f to accept the current autosuggestion (if available)
    if [[ -n ${widgets[autosuggest-accept]} ]]; then
      bindkey '^f' autosuggest-accept
    fi
  fi
fi

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
command -v go >/dev/null 2>&1 && export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/adamoldin/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "/Users/adamoldin/.bun/_bun" ] && source "/Users/adamoldin/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/adamoldin/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# GitHub CLI (guarded)
if command -v gh >/dev/null 2>&1; then
  # zsh completions for gh
  eval "$(gh completion -s zsh)"

  # Handy gh aliases (shell-level, not gh's internal alias)
  alias ghco='gh pr checkout'
  alias ghpr='gh pr create -f'
  alias ghpv='gh pr view -w'
  alias ghcl='gh repo clone'
fi

# Starship (guarded)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi