#! /bin/sh

# noob don't judge

# bash -c "$(wget -qO https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/quicker-setup-arch.sh"

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
pacman -S --needed --no-confirm cowsay fortune-mod git github-cli flatpak zsh neovim wl-clipboard gnome-tweaks base-devel

echo "Installing Flatpaks . . ."
flatpak install com.mattjakeman.ExtensionManager com.raggesilver.BlackBox org.prismlauncher.PrismLauncher

echo "Installing Paru(AUR) . . ."
mkdir Git
cd Git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~

echo "Installing AUR packages . . ."
paru -Syu
paru -S mkinitcpio-firmware adw-gtk3

echo "Cloning ZSH plugins"
mkdir -p ~/.config/zsh
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/zsh/plugins/fzf
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions

echo "Getting dotfiles . . ."
mkdir -p ~/.config/git
echo ".dotfiles" >> ~/.config/git/ignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"
mv ~/.gitconfig $XDG_CONFIG_HOME/git/config

chsh -s /bin/zsh
