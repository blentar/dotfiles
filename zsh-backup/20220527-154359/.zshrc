# Faster Neofetch
#fastfetch

# Dracula Theme
# source /home/dilan/repos/dracula-zsh/dracula.zsh-theme

# Autocomplete
#source ~/.config/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# AutoSuggestions
source ~/.config/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /home/dilan/.config/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
eval "$(starship init zsh)"
