#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

# Installing from Brewfile

echo "Enter superuser (sudo) password to edit /etc/shells"
echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells'

chsh -s '/usr/local/bin/zsh'