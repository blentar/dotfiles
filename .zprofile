# ZPROFILE

export EDITOR="nvim"
export PATH="$PATH:/home/dilan/.local/bin"
export MOZ_ENABLE_WAYLAND=1 firefox

# Set auto-notify expiry to 3 seconds.
export AUTO_NOTIFY_EXPIRE_TIME=3000

if [[ $XDG_SESSION_DESKTOP != "KDE" ]]; then
	export QT_QPA_PLATFORMTHEME="qt5ct"
fi

# Clean-up
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state/"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
[ -f "$XDG_DATA_HOME"/cargo/env ] && source "$XDG_DATA_HOME"/cargo/env
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export ZDOTDIR="$HOME"/.config/zsh

export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
