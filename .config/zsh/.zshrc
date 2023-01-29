# My ZSHRC.

stty stop undef # Disable ctrl-s to freeze terminal

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable colors and change prompt:
#autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_CACHE_HOME/zsh/history"

# Aliases:
alias tree='tree -a -I .git'
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cl='clear'
alias x='exit'
alias vim='nvim'
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""
alias ls='lsd -Av --group-directories-first'
alias ll='lsd -Avl --group-directories-first'

# Options:
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt autocd
setopt interactive_comments

# Compinit:
autoload -U compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# Extra completions:
fpath=(~/.config/zsh/zsh-completions/src $fpath)

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Source plugins:
source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

zstyle ':completion:*' menu select

# Set Up and Down keys to use history-substring-search.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Autosuggest will first look at history then try to use completion.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Load the powerlevel10k theme:
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-~}/.p10k.zsh ]] || source ${ZDOTDIR:-~}/.p10k.zsh

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
