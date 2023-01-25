#! /bin/sh

# noob dont judge

# bash -c "$(wget -qO https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/fedora.sh"

echo "Adding options to DNF config . . ."
echo "max_parallel_downloads=3
defaultyes=True
keepcache=True" | sudo tee -a /etc/dnf/dnf.conf >> /dev/null

echo "Moving bash history file (maybe) . . ."
mkdir ~/.cache/{zsh,bash}
echo "HISTFILE=~/.cache/bash/history" >> .bashrc
[ -f "$HOME/.bash_history" ] && mv ~/.bash_history ~/.cache/bash/history

echo "Updating and Installing some packages . . ."
sudo dnf update -y
sudo dnf install gh util-linux-user cowsay fortune-mod zsh neovim wl-clipboard gnome-tweaks -y

echo "Adding RPM Fusion . . ."
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

echo "Adding real Flathub . . ."
flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Flatpaks . . ."
flatpak install com.mattjakeman.ExtensionManager org.prismlauncher.PrismLauncher

echo "Adding a calcastor/gnome-patched COPR repo for dynamic buffering . . ."
sudo dnf copr enable calcastor/gnome-patched
sudo dnf update

echo "Installing adw-gtk3 . . ."
sudo dnf copr enable nickavem/adw-gtk3
sudo dnf install adw-gtk3

echo "Cloning ZSH plugins"
mkdir ~/.config/zsh
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/zsh/plugins/fzf
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions

echo "Adding dotfiles . . ."
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"

chsh -s /bin/zsh
