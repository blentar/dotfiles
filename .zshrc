
# Plugins That need to be on top.
#source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[yellow]%}%n%{$fg[blue]%}@%{$fg[cyan]%}%M %{$fg[magenta]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
#autoload -U compinit
#zstyle ':completion:*' menu select
#zmodload zsh/complist
#compinit
#_comp_options+=(globdots)		# Include hidden files.

# Aliases and Shortcuts.
alias tree='tree -a -I .git'
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl='clear'
alias x='exit'
alias vim='nvim'
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""
alias ls="ls --color=auto"
#alias sudo="doas"
#alias apt="nala"

# Source plugins.
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
