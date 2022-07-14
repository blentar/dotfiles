export EDITOR="micro"
export PATH="$PATH:/home/dilan/.local/bin"
export MOZ_ENABLE_WAYLAND=1 firefox

if [[ $XDG_SESSION_DESKTOP != "KDE" ]]; then
	export QT_QPA_PLATFORMTHEME="qt5ct"
fi

# Clean-up
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state/"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$HOME"/.config/zsh

export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
