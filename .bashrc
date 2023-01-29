# BASHRC

stty -ixon # Disabled ctrl-s and ctrl-q.
shopt -s autocd # Lets you cd into a directory by simply typing it.
HISTSIZE=10000 # Sets the size of the history file to 10,000.
HISTFILE=~/.cache/bash/history # Changes the history file location.

# Bash prompt.
export PS1="\e[1;32m[\e[1;33m\u\e[1;34m@\e[1;36m\h \e[1;35m\W\e[1;32m]\e[m$ "

# My aliases
alias tree='tree -a -I .git'
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl='clear'
alias x='exit'
alias vim='nvim'
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""
alias ls='ls --color=auto'

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash
