#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

fortune | cowthink

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl='clear'
alias nf='neofetch'
alias cat='bat'
alias cf='vim ~/.config/fish/config.fish'
alias po='poweroff'
alias sd='shutdown'
alias rb='reboot'
alias x='exit'
alias copy='wl-copy'
alias paste='wl-paste'
alias nightly='firefox-nightly'
alias ls='lsd --color=auto'

# PS1='[\u@h \W]\$ '

eval "$(starship init bash)"
