# Instructions for myself, with commands to copy and paste.

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
git clone
