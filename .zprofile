export EDITOR="nvim"
export PATH="$PATH:/home/dilan/.local/bin"
export MOZ_ENABLE_WAYLAND=1 firefox

if [[ $XDG_SESSION_DESKTOP != "KDE" ]]; then
	export QT_QPA_PLATFORMTHEME="qt5ct"
fi
