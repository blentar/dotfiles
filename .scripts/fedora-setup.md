# Instructions for myself, with commands to copy and paste.

You probably already did it but in case, change the hostname cause fedora doesn't do it.\n
`hostnamectl set-hostname fedora` \n
Copy this and paste it into /etc/dnf/dnf.conf \n
`fastestmirror=False
max_parallel_downloads=3
defaultyes=True
keepcache=True` \n
Upgrade then install some useful packages. \n
`sudo dnf --refresh upgrade` \n
`sudo dnf install g++ fd-find lsd gh util-linux-user zsh neovim wl-clipboard gnome-tweaks` \n
Install RPM Fusion. \n
`sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm` \n
Add AppStream metadata for RPM Fusion. \n
`sudo dnf groupupdate core` \n
Install multimedia codecs. \n
`sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin` \n
`sudo dnf groupupdate sound-and-video` \n
Install libva-intel-drive.
`sudo dnf install libva-intel-driver` \n
