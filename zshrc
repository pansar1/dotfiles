echo 'Hello from .zshrc'

# Set variables

# Change ZSH Options

# Create Aliases
alias ls='ls -lAFh'

# Customize Prompt(s)
PROMPT='
%1~ %L %# '

RPROMPT='%*'

# Add Locations to $PATH Variable

# Write Handy Functions
Function mkcd() {
 mkdir -p "$@" && cd "$_";
}

# Use ZSH Plugins