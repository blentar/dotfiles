#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#fortune | cowthink

paleofetch

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
alias swayrc='vim ~/.config/sway/config'
alias swaylock='swaylock -i ~/git/dracula/wallpaper/base.png'
alias cf='vim ~/.bashrc'
alias fetch='paleofetch'

# PS1='[\u@h \W]\$ '

eval "$(starship init bash)"
