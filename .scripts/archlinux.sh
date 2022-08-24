#! /bin/sh

# bash -c "$(wget -qO https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/archlinux.sh"

while true; do
    read -p "Are you using GNOME? [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Wrong script"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Give me root priveleges"
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "Thank you"

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
nvim /etc/pacman.conf 

mkdir ~/.cache/{zsh,bash}
echo "HISTFILE=~/.cache/bash/history" >> .bashrc
[ -f "$HOME/.bash_history" ] && mv ~/.bash_history ~/.cache/bash/history

pacman -Syu --no-confirm
pacman -S --needed --no-confirm github-cli flatpak papirus-icon-theme alacritty zsh neovim wl-clipboard xclip mozilla-fira-sans-fonts papirus-icon-theme gnome-tweaks

flatpak install extensionmanager polymc

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip 
unzip ~/Downloads/JetBrainsMono.zip -d ~/Downloads/JetBrainsMono/
sudo cp ~/Downloads/JetBrainsMono/* /usr/share/fonts/
fc-cache -fv

echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"

chsh -s /bin/zsh
