# Mise aliases for convenience
alias m='mise'
alias mi='mise install'
alias mu='mise use'
alias ml='mise ls'
alias mlr='mise ls-remote'
alias mw='mise which'

# Helper functions
use-node() {
  if [ -z "$1" ]; then
    echo "Usage: use-node <version>"
    echo "Example: use-node 20"
    return 1
  fi
  mise use node@$1
}

use-python() {
  if [ -z "$1" ]; then
    echo "Usage: use-python <version>"
    echo "Example: use-python 3.12"
    return 1
  fi
  mise use python@$1
}

use-go() {
  if [ -z "$1" ]; then
    echo "Usage: use-go <version>"
    echo "Example: use-go 1.22"
    return 1
  fi
  mise use go@$1
}

# List all available tools
mise-tools() {
  echo "=== Installed Tools ==="
  mise ls
  echo ""
  echo "=== Available Tools ==="
  echo "Use 'mlr <tool>' to see all versions. Examples:"
  echo "  mlr node"
  echo "  mlr python"
  echo "  mlr go"
}
