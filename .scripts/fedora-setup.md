# Instructions for myself, with commands to copy and paste.
## These instructions should not be followed by anyone other than myself, especially the last few commands, they are specific to my setup, and most my dotfiles aren't any good either.

You probably already did it but in case, change the hostname cause fedora doesn't do it.
```
hostnamectl set-hostname fedora
```
Copy this and paste it into /etc/dnf/dnf.conf
```
fastestmirror=False
max_parallel_downloads=3
defaultyes=True
keepcache=True
```
Upgrade then install some useful packages.
```
sudo dnf --refresh upgrade
```
```
sudo dnf install g++ fd-find lsd gh util-linux-user zsh neovim wl-clipboard gnome-tweaks
```
Install RPM Fusion.
```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
Add AppStream metadata for RPM Fusion.
```
sudo dnf groupupdate core
```
Install multimedia codecs.
```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```
```
sudo dnf groupupdate sound-and-video
```
Install libva-intel-drive.
```
sudo dnf install libva-intel-driver
```
Delete the filtered flathub remote.
```
flatpak remote-delete flathub
```
Download the flathub.flatpakrepo file from [here](https://flatpak.org/setup/Fedora), then install flathub with GNOME Software. \ Then install these flatpaks.
```
flatpak install com.mattjakeman.ExtensionManager org.prismlauncher.PrismLauncher com.raggesilver.BlackBox
```
Add this copr repo and update.
```
sudo dnf copr enable calcastor/gnome-patched
```
```
sudo dnf update
```
Clone these ZSH plugins, make the directory first.
```
mkdir -p ~/.config/zsh/
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh/fast-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.config/zsh/zsh-completions
```
Install fzf, remember to not update configuration.
```
mkdir -p ~/.config/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/fzf/fzf
~/.config/fzf/fzf/install --xdg --key-bindings --completion --no-update-rc
```
Now move the default .bashrc so it isn't in the way of the dotfiles.
```
mkdir ~/.cache/bash
mkdir ~/.cache/zsh
mkdir ~/.config/bash_bak
mv .bashrc .config/bash_bak/
mv .bash_profile .config/bash_bak/
rm .bash_logout
rm .bash_history
```
Get the dotfiles.
```
mkdir -p ~/.config/git
echo "~/.dotfiles" >> ~/.config/git/ignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackeFiles no
```
Additional git config.
```
git config --global user.name "blentar"
git config --global user.email "dilan@dilan"
mv ~/.gitconfig ~/.config/git/config
```
Change login shell to ZSH
```
chsh -s /usr/bin/zsh
```
Now copy ~/.config/2560x1440.bin into /lib/firmware/edid/
```
sudo mkdir /lib/firmware/edid
sudo cp ~/.config/2560x1440.bin /lib/firmware/edid/
```
Add this line into /etc/default/grub.
```
GRUB_CMDLINE_LINUX_DEFAULT="drm.edid_firmware=edid/2560x1440.bin"
```
Update grub config.
```
grub2-mkconfig -o /etc/grub2.cfg
```
Download FiraCode Nerd Font.
```
mkdir ~/.local/share/fonts/FiraCode -p
mkdir ~/Downloads/FiraCode
cd ~/Downloads/FiraCode
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip
mv *.ttf ~/.local/share/fonts/FiraCode
```
## Now restart.
