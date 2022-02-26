function fish_greeting
    cowthink (fortune)
end

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl=clear
alias nf=neofetch
alias ls=lsd
alias cat=bat
alias cf='vim ~/.config/fish/config.fish'
alias po=poweroff
alias sd=shutdown
alias rb=reboot

starship init fish | source

