# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/Users/pathak14/Library/Python/3.9/bin

export PATH


eval "$(/opt/homebrew/bin/brew shellenv)"
