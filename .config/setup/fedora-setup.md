hostname
```
hostnamectl set-hostname fedora
```
paste into /etc/dnf/dnf.conf
```
fastestmirror=False
max_parallel_downloads=3
defaultyes=True
keepcache=True
```
update nd install
```
sudo dnf --refresh upgrade
```
```
sudo dnf install g++ fd-find lsd gh util-linux-user zsh neovim wl-clipboard gnome-tweaks
```
rpm fusion.
```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
rpmf appstream metadata
```
sudo dnf groupupdate core
```
codecs
```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```
```
sudo dnf groupupdate sound-and-video
```

flathub
```
flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```
```
flatpak install com.mattjakeman.ExtensionManager org.prismlauncher.PrismLauncher com.raggesilver.BlackBox
```

gnome thing
```
sudo dnf copr enable calcastor/gnome-patched
```
```
sudo dnf update
```
zsh plugins to clone
```
mkdir -p ~/.config/zsh/
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh/fast-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.config/zsh/zsh-completions
```
fzf, dont update config
```
mkdir -p ~/.config/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/fzf/fzf
~/.config/fzf/fzf/install --xdg --key-bindings --completion --no-update-rc
```
clear out the home a bit 
```
mkdir ~/.cache/bash
mkdir ~/.cache/zsh
mkdir ~/.config/bash_bak
mv .bashrc .config/bash_bak/
mv .bash_profile .config/bash_bak/
rm .bash_logout
rm .bash_history
```
dotfiles
```
mkdir -p ~/.config/git
echo "~/.dotfiles" >> ~/.config/git/ignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no
```
git stuff
```
git config --global user.name "blentar"
git config --global user.email "batter@banter"
mv ~/.gitconfig ~/.config/git/config
```
change shell
```
chsh -s /usr/bin/zsh
```
download jetbrains nf or dont

reboot
