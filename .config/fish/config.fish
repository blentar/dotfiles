function fish_greeting
    paleofetch
end

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

starship init fish | source
