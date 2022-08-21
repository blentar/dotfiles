#! /bin/sh

# bash -c "$(wget -qO https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/fedora.sh"

echo "max_parallel_downloads=3
defaultyes=True
keepcache=True" | sudo tee -a /etc/dnf/dnf.conf >> /dev/null

mkdir ~/.cache/{zsh,bash}
echo "HISTFILE=~/.cache/bash/history" >> .bashrc
[ -f "$HOME/.bash_history" ] && mv ~/.bash_history ~/.cache/bash/history

sudo dnf update
sudo dnf install util-linux-user yaru-theme alacritty zsh neovim wl-clipboard mozilla-fira-sans-fonts papirus-icon-theme mozilla-fira-fonts-common fira-code-fonts gnome-tweaks

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install  extensionmanager polymc

sudo dnf copr enable shrisha/gnome-shell-mutter-tripplebuffered-41
sudo dnf update

sudo dnf copr enable nickavem/adw-gtk3
sudo dnf install adw-gtk3

mkdir -p ~/gitstuff/zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/gitstuff/zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/gitstuff/zsh-plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete ~/gitstuff/zsh-plugins/zsh-autocomplete

echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"

chsh -s /bin/zsh
