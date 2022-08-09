#! /bin/sh

# bash -c "$(wget -qO https://github.com)"

echo "
max_parallel_downloads=3
defaultyes=True
keepcache=True" | sudo tee -a /etc/dnf/dnf.conf

mkdir ~/.cache/{zsh,bash}
echo "HISTFILE=~/.cache/bash/history"
[ -f "$HOME/.bash_history" ] && mv ~/.bash_history ~/.cache/bash/history

sudo dnf update
sudo dnf install zsh micro wl-clipboard mozilla-fira-{mono,sans}-fonts mozilla-fira-fonts-common gnome-tweaks

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

sudo flatpak remote-delete flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"
