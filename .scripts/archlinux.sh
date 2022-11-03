#! /bin/sh

# noob don't judge

# bash -c "$(wget -qO https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/archlinux.sh"

while true; do
    read -p "Are you using GNOME? [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Not a good idea."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "You have to give me root privileges first."
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "Thank You!"

echo "You gotta edit the pacman.conf by yourself im still a noob"
sleep 1
echo Ready
sleep 1
echo 3
sleep 1
echo 2
sleep 1
echo 1
sleep 1
nano /etc/pacman.conf 

echo "Moving bash history file (maybe) . . ."
mkdir ~/.cache/{zsh,bash}
echo "HISTFILE=~/.cache/bash/history" >> .bashrc
[ -f "$HOME/.bash_history" ] && mv ~/.bash_history ~/.cache/bash/history

echo "Updating and Installing some packages . . ."
pacman -Syu --no-confirm
pacman -S --needed --no-confirm git github-cli flatpak zsh neovim wl-clipboard gnome-tweaks

echo "Installing Flatpaks . . ."
flatpak install extensionmanager polymc

echo "Getting dotfiles . . ."
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"

chsh -s /bin/zsh
