#!/usr/bin/env bash
#
# Mise Setup Script
# Installs and configures mise runtime manager with Node.js, Python, and Go
#

set -e  # Exit on error

echo "=== Mise Setup ==="
echo ""

# Check if mise is installed
if ! command -v mise &> /dev/null; then
  echo "❌ Error: mise is not installed"
  echo "Install it first with: brew install mise"
  exit 1
fi

echo "✓ mise is installed: $(mise --version)"
echo ""

# Install Node.js versions
echo "📦 Installing Node.js versions..."
if mise ls node | grep -q "25.2.1"; then
  echo "  ✓ node@25.2.1 already installed"
else
  echo "  Installing node@25..."
  mise install node@25
fi

if mise ls node | grep -q "24.12.0"; then
  echo "  ✓ node@lts (24.12.0) already installed"
else
  echo "  Installing node@lts..."
  mise install node@lts
fi

echo ""

# Install Python
echo "📦 Installing Python..."
if mise ls python | grep -q "3.12"; then
  echo "  ✓ python@3.12 already installed"
else
  echo "  Installing python@3.12..."
  mise install python@3.12
fi

echo ""

# Install Go
echo "📦 Installing Go..."
if mise ls go | grep -q "1.25"; then
  echo "  ✓ go@latest already installed"
else
  echo "  Installing go@latest..."
  mise install go@latest
fi

echo ""

# Set global defaults
echo "🔧 Setting global defaults..."
mise use -g node@lts python@3.12 go@latest
echo "  ✓ Set node@lts, python@3.12, go@latest as global defaults"
echo ""

# Show installed versions
echo "📋 Installed versions:"
mise ls
echo ""

# Configure npm prefix to avoid conflicts
echo "🔧 Configuring npm..."
NODE_VERSION=$(mise ls node | grep -E "lts|24\." | head -1 | awk '{print $2}')
mise exec -- npm config set prefix "$HOME/.local/share/mise/installs/node/$NODE_VERSION"
echo "  ✓ npm prefix configured"
echo ""

# Install npm global packages
echo "📦 Installing npm global packages..."
echo "  This may take a few minutes..."
mise exec -- npm install -g \
  @ionic/cli \
  firebase-tools \
  http-server \
  json-server \
  trash-cli \
  typescript \
  yarn \
  > /dev/null 2>&1

echo "  ✓ npm global packages installed"
echo ""

# Verify installation
echo "✅ Verification:"
echo "  Node:   $(mise exec -- node -v)"
echo "  npm:    $(mise exec -- npm -v)"
echo "  Python: $(mise exec -- python --version)"
echo "  Go:     $(mise exec -- go version | cut -d' ' -f3)"
echo ""

echo "🎉 Mise setup complete!"
echo ""
echo "💡 Tip: Add 'eval \"\$(mise activate zsh)\"' to your .zshrc to enable mise"
echo "💡 Tip: Use 'mise install' in project directories to auto-install versions from .tool-versions"
