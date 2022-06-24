
#!/bin/bash

## UBUNTU ONLY ##

echo "Updating ..."
sudo apt update
sudo apt upgrade -y
echo "Installing important stuff..."
sudo apt install -y zsh git wget curl keepassxc gh flatpak gnome-software-plugin-flatpak gnome-tweaks gnome-shell-extension-manager

echo "Removing Installed Snaps..."
snap list | awk '{print $1}' | grep -v Name | grep -v bare | grep -v core | grep -v snapd > round1snaps
xargs sudo snap remove < round1snaps
sudo snap remove snapd-desktop-integration
sudo snap remove bare
snap list | awk '{print $1}' | grep core > coresnap
xargs sudo snap remove < coresnap
rm round1snaps coresnap

echo "Removing snapd..."
sudo systemctl stop snapd
sudo apt purge -y snapd
rm -rf ~/snap/
sudo rm -rf /var/cache/snapd/

echo "Preventing snapd from being installed by 'accident'"
echo "Package: snapd
Pin: release a=*
Pin-Priority: -10" > nosnap.pref
sudo mv nosnap.pref /etc/apt/preferences.d/

echo "Installing Starship Prompt..."
curl -sS https://starship.rs/install.sh | sh

echo "Adding Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install polymc

echo "Creating directories for bash & zsh history..."
mkdir ~/.cache/{bash,zsh}
echo "Cloning zsh plugins..."
mkdir ~/.config/zsh-plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh-plugins/zsh-syntax-highlighting

echo "Pulling Dotfiles..."
echo ".dotfiles" >> ~/.gitignore
git clone --bare https://github.com/blentar/dotfiles $HOME/.dotfiles
[ -f "$HOME/.bashrc" ] && echo "HISTFILE="$HOME/.cache/bash/history"" >> .bashrc && mv .bashrc .bashrc-backup
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
chsh -s /bin/zsh

# Nala Apt Frontend
echo "Installing Nala"
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update && sudo apt install nala

# Firefox Deb Package
echo "Installing Firefox as a .deb"
sudo add-apt-repository ppa:mozillateam/ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
sudo apt install firefox
