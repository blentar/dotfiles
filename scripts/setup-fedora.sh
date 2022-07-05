
#!/bin/bash

## FEDORA ONLY ##

echo "
max_parallel_downloads=3
defaultyes=True
keepcache=True" | sudo tee -a /etc/dnf/dnf.conf

echo "Enabling RPM Fusion"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

echo "Updating ..."
sudo dnf update
echo "Installing important stuff..."
sudo dnf install zsh starship git wget curl keepassxc gnome-tweaks

echo "Adding Flathub..."
flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install polymc com.mattjakeman.ExtensionManager

echo "Creating directories for bash & zsh history..."
mkdir ~/.cache/{bash,zsh}
echo "Cloning zsh plugins..."
mkdir ~/.config/zsh-plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh-plugins/zsh-syntax-highlighting

echo "Pulling Dotfiles..."
echo ".dotfiles" >> ~/.gitignore
git clone --bare https://github.com/blentar/dotfiles $HOME/.dotfiles
[ -f "$HOME/.bashrc" ] && echo "HISTFILE="$HOME/.cache/bash/history"" >> .bashrc
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
chsh -s /bin/zsh
