# BASHRC

stty -ixon # Disabled ctrl-s and ctrl-q.
shopt -s autocd # Lets you cd into a directory by simply typing it.
HISTSIZE=10000 # Sets the size of the history file to 10,000.
HISTFILE=~/.cache/bash/history # Changes the history file location.

# Bash prompt.
export PS1="\e[0;32m[\e[0;33m\u\e[0;34m@\e[0;36m\h \e[0;35m\W\e[0;32m]\e[m$ "

# My aliases
alias tree='tree -a -I .git'
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl='clear'
alias x='exit'
alias vim='nvim'
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""
alias ls='ls --color=auto'
