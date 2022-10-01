#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

# Installing from Brewfile

echo "Enter superuser (sudo) password to edit /etc/shells"
echo '/opt/homebrew/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null

chsh -s '/opt/homebrew/bin/zsh'