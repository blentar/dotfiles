if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
end

#function fish_prompt
#    set -l prompt_symbol '$ '
#    fish_is_root_user; and set prompt_symbol '# '
#
#    echo -s (set_color --bold green)"["(set_color yellow)$USER(set_color blue)"@"(set_color cyan)$hostname" "(set_color purple)(prompt_pwd)(set_color green)"]"(set_color normal)$prompt_symbol
#end

alias tree='tree -a -I .git'
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl='clear'
alias x='exit'
alias vim='nvim'
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""
alias ls='lsd -Av --group-directories-first'
alias ll='lsd -Avl --group-directories-first'
