# ============================================================================
# ZSH Functions
# ============================================================================

# ------------------------------
# Directory Navigation
# ------------------------------

# Create directory and cd into it
mkcd() {
  if [ -z "$1" ]; then
    echo "Usage: mkcd <directory>"
    return 1
  fi
  mkdir -p "$@" && cd "$_"
}

# Go up N directories
up() {
  local d=""
  local limit=${1:-1}
  for ((i=1 ; i <= limit ; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# ------------------------------
# Archive Handling
# ------------------------------

# Universal archive extractor
extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <archive-file>"
    echo "Supported formats: tar.gz, tar.bz2, tar.xz, zip, rar, 7z, gz, bz2, xz"
    return 1
  fi

  if [ ! -f "$1" ]; then
    echo "Error: '$1' is not a valid file"
    return 1
  fi

  case "$1" in
    *.tar.bz2|*.tbz2) tar xjf "$1" ;;
    *.tar.gz|*.tgz)   tar xzf "$1" ;;
    *.tar.xz|*.txz)   tar xJf "$1" ;;
    *.tar)            tar xf "$1" ;;
    *.bz2)            bunzip2 "$1" ;;
    *.gz)             gunzip "$1" ;;
    *.xz)             unxz "$1" ;;
    *.zip)            unzip "$1" ;;
    *.rar)            unrar x "$1" ;;
    *.7z)             7z x "$1" ;;
    *.Z)              uncompress "$1" ;;
    *)                echo "Error: '$1' cannot be extracted via extract()" ;;
  esac
}

# Create a tar.gz archive
targz() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: targz <archive-name.tar.gz> <directory>"
    return 1
  fi
  tar czf "$1" "$2"
  echo "Created archive: $1"
}

# ------------------------------
# Development
# ------------------------------

# Initialize a new project with mise
init-project() {
  if [ -z "$1" ]; then
    echo "Usage: init-project <project-name>"
    return 1
  fi

  local project_name="$1"

  echo "Creating project: $project_name"
  mkdir -p "$project_name"
  cd "$project_name"

  # Initialize git
  git init
  echo "✓ Git initialized"

  # Create basic .gitignore
  cat > .gitignore << 'EOF'
node_modules/
.DS_Store
.env
.env.local
dist/
build/
*.log
EOF
  echo "✓ Created .gitignore"

  # Ask for Node version
  echo ""
  echo "Which Node version? (press Enter for LTS)"
  read -r node_version
  node_version=${node_version:-lts}

  # Create .mise.toml
  cat > .mise.toml << EOF
[tools]
node = "$node_version"
EOF
  echo "✓ Created .mise.toml with Node $node_version"

  # Install node via mise
  mise install
  echo "✓ Installed Node"

  # Initialize npm
  mise exec -- npm init -y
  echo "✓ Initialized package.json"

  echo ""
  echo "🎉 Project '$project_name' ready!"
  echo "   - Git initialized"
  echo "   - Node $node_version installed via mise"
  echo "   - package.json created"
}

# Quick serve with custom port
serve() {
  local port="${1:-8000}"
  echo "Starting HTTP server on port $port..."
  echo "Open: http://localhost:$port"
  python3 -m http.server "$port"
}

# ------------------------------
# System Utilities
# ------------------------------

# Show disk usage of current directory (prettified)
disk-usage() {
  if [ -n "$1" ]; then
    du -sh "$1"/* 2>/dev/null | sort -hr | head -20
  else
    du -sh * 2>/dev/null | sort -hr | head -20
  fi
}

# Show all IP addresses
myip() {
  echo "Public IP:  $(curl -s ifconfig.me)"
  echo "Local IP:   $(ipconfig getifaddr en0 2>/dev/null || echo 'Not connected')"
  echo "Hostname:   $(hostname)"
}

# Find process using a specific port
port() {
  if [ -z "$1" ]; then
    echo "Usage: port <port-number>"
    return 1
  fi
  lsof -i ":$1"
}

# Kill process on specific port
killport() {
  if [ -z "$1" ]; then
    echo "Usage: killport <port-number>"
    return 1
  fi

  local pid=$(lsof -ti ":$1")
  if [ -n "$pid" ]; then
    echo "Killing process $pid on port $1"
    kill -9 "$pid"
  else
    echo "No process found on port $1"
  fi
}

# ------------------------------
# Git Helpers
# ------------------------------

# Quick commit all changes
gac() {
  if [ -z "$1" ]; then
    echo "Usage: gac <commit-message>"
    return 1
  fi
  git add --all
  git commit -m "$1"
}

# Create new branch and switch to it
gnb() {
  if [ -z "$1" ]; then
    echo "Usage: gnb <branch-name>"
    return 1
  fi
  git checkout -b "$1"
}

# Show current git branch
current-branch() {
  git branch --show-current 2>/dev/null || echo "Not a git repository"
}

# ------------------------------
# Search
# ------------------------------

# Find files by name (case-insensitive)
ff() {
  if [ -z "$1" ]; then
    echo "Usage: ff <filename-pattern>"
    return 1
  fi

  if command -v fd >/dev/null 2>&1; then
    fd -i "$1"
  else
    find . -iname "*$1*" 2>/dev/null
  fi
}

# Search file contents (case-insensitive)
search() {
  if [ -z "$1" ]; then
    echo "Usage: search <text-to-find> [path]"
    return 1
  fi

  local path="${2:-.}"

  if command -v rg >/dev/null 2>&1; then
    rg -i "$1" "$path"
  else
    grep -ri "$1" "$path"
  fi
}

# ------------------------------
# Misc
# ------------------------------

# Create a backup of a file
backup() {
  if [ -z "$1" ]; then
    echo "Usage: backup <file>"
    return 1
  fi

  if [ ! -f "$1" ]; then
    echo "Error: '$1' is not a file"
    return 1
  fi

  local backup_name="${1}.backup.$(date +%Y%m%d_%H%M%S)"
  cp "$1" "$backup_name"
  echo "Backup created: $backup_name"
}

# Show command history with timestamps
hist() {
  if command -v atuin >/dev/null 2>&1; then
    atuin search "$@"
  else
    fc -liD -100 | fzf
  fi
}
