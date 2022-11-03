#! /bin/sh

# noob dont judge

# bash -c "$(wget -qO https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/fedora.sh"

echo "You have to give me root privileges first."
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "Thank You!"

echo "Adding options to DNF config . . ."
echo "max_parallel_downloads=3
defaultyes=True
keepcache=True" >> /etc/dnf/dnf.conf
#keepcache=True" | sudo tee -a /etc/dnf/dnf.conf >> /dev/null

echo "Moving bash history file (maybe) . . ."
mkdir ~/.cache/{zsh,bash}
echo "HISTFILE=~/.cache/bash/history" >> .bashrc
[ -f "$HOME/.bash_history" ] && mv ~/.bash_history ~/.cache/bash/history

echo "Updating and Installing some packages . . ."
dnf update -y
dnf install gh util-linux-user zsh neovim wl-clipboard gnome-tweaks -y

echo "Adding RPM Fusion . . ."
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf groupupdate core -y
dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
dnf groupupdate sound-and-video -y

echo "Adding real Flathub . . ."
flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Flatpaks . . ."
flatpak install com.mattjakeman.ExtensionManager org.prismlauncher.PrismLauncher

echo "Adding a calcastor/gnome-patched COPR repo for dynamic buffering . . ."
dnf copr enable calcastor/gnome-patched
dnf update

echo "Installing adw-gtk3 . . ."
dnf copr enable nickavem/adw-gtk3
dnf install adw-gtk3
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
gsettings set org.gnome.desktop.wm.preferences theme "adw-gtk3-dark"

echo "Adding dotfiles . . ."
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"

chsh -s /bin/zsh
