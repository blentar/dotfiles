#! /bin/sh

# DISCLAIMER: Don't use this script, I don't recommend using my dotfiles, use someone
# else's as mine are not very good and a lot of my configs are unfinished.

# wget https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/quicker-setup-fedora.sh && chmod +x quicker-setup-fedora.sh && ./quicker-setup-fedora.sh

retry_command() {
	while true; do
		"$@"
		if [ $? -eq 0 ]; then 
			echo -e "\033[1;33m	Done.\033[0;35m"
			return
		fi
			
		echo -en "\033[1;33m	Command Failed, Try Again or Skip? [y/s/n] \033[0;35m"
		read -p ysn
		case $ysn in
			[Yy]* ) echo "\033[0;35m	Retrying . . ."; continue;;
			[Ss]* ) echo "\033[0;33m	Skipping . . ."; break;;
			[Nn]* ) echo "\033[1;31m	Exiting . . ."; exit 1;;
		esac
	done
}

if [ -f ~/.cache/quicker-setup-ran ] ; then
	echo -e "\033[1;31m	Script has already been ran, don't know how much it can\n	break things if ran again.\033[0m"
	exit 1
else continue ; fi

echo -e "\033[1;33m	Warning: This script is only intended for myself, if you are not me\n	I do not recommend using this or any of my dotfiles as most of\n	aren't very good and some are unfinished."
echo -en "Continue (don't if you're not me)? [y/n] "
read -p yn
case $yn in
	[Yy]* ) echo "\033[1;33m	Proceed with caution.\033[0;35m"; continue;;
	[Nn]* ) echo "\033[1;31m	Exiting..."; exit 1;;
esac

echo -e "\033[1;34m	Adding options to DNF config . . .\033[0;35m"
echo "max_parallel_downloads=3
defaultyes=True
keepcache=True" | sudo tee -a /etc/dnf/dnf.conf >> /dev/null
echo -e "\033[1;32m	Done.\033[0;35m"

echo -e "\033[1;34m	Moving bash stuff out of my \$HOME . . .\033[0;35m"
retry_command mkdir ~/.cache/{zsh,bash}
if [ -f "$HOME/.bash_history" ] ; then
	echo -e "\033[1;34m	Moving .bash_history . . .\033[0;35m"
	mv ~/.bash_history ~/.cache/bash/history
	echo -e "\033[1;32m	Done.\033[0;35m"
else echo -e "\033[1;36m	.bash_history not found at home, skipping . . .\033[0;35m" ; fi
retry_command mkdir ~/.config/bash
if [ -f "$HOME/.bashrc" ] ; then
	echo -e "\033[1;34m	Moving .bashrc . . .\033[0;35m"
	mv ~/.bashrc ~/.config/bash/
	echo -e "\033[1;32m	Done.\033[-;35m"
else echo -e "\033[1;36m	.bashrc not found at home, skipping . . .\033[0;35m" ; fi

echo -e "\033[1;34m	Updating . . .\033[0;35m"
retry_command sudo dnf update -y
echo -e "\033[1;34m	Installing useful stuff . . .\033[0;35m"
retry_command sudo dnf install g++ fd-find lsd gh util-linux-user cowsay fortune-mod zsh neovim wl-clipboard gnome-tweaks -y

echo -e "\033[1;34m	Adding RPM Fusion . . .\033[0;35m"
retry_command sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
retry_command sudo dnf groupupdate core -y
retry_command sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
retry_command sudo dnf groupupdate sound-and-video -y
echo "\033[1;34m	Installing libva-intel-driver . . .\033[0;35m"
retry_command sudo dnf install libva-intel-driver -y

echo "\033[1;34m	Adding real Flathub . . .\033[0;35m"
retry_command sudo flatpak remote-delete flathub
retry_command sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "\033[1;34m	Installing Flatpaks . . .\033[0;35m"
retry_command flatpak install com.mattjakeman.ExtensionManager org.prismlauncher.PrismLauncher

echo "\033[1;34m	Adding a calcastor/gnome-patched COPR repo for dynamic buffering . . .\033[0;35m"
retry_command sudo dnf copr enable calcastor/gnome-patched
retry_command sudo dnf update

echo "\033[1;34m	Installing adw-gtk3 . . .\033[0;35m"
retry_command sudo dnf copr enable nickavem/adw-gtk3
retry_command sudo dnf install adw-gtk3

echo "\033[1;34m	Cloning ZSH plugins . . .\033[0;35m"
retry_command mkdir -p ~/.config/zsh
retry_command git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh/plugins/fast-syntax-highlighting
retry_command git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k
retry_command git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/plugins/zsh-history-substring-search
retry_command git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
retry_command git clone https://github.com/Aloxaf/fzf-tab ~/.config/zsh/plugins/fzf-tab
retry_command git clone https://github.com/zsh-users/zsh-completions ~/.config/zsh/plugins/zsh-completions

echo "\033[1;34m	Installing fzf with git . . .\033[0;35m"
retry_command mkdir -p ~/.config/fzf
retry_command git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/zsh/plugins/fzf
retry_command ~/.config/zsh/plugins/fzf/install --xdg --key-bindings --completion --no-update-rc

echo "\033[1;34m	Adding dotfiles . . .\033[0;35m"
retry_command mkdir -p ~/.config/git
echo ".dotfiles" >> ~/.config/git/ignore
retry_command git clone --bare https://github.com/blentar/dotfiles .dotfiles
retry_command git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
retry_command git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

retry_command git config --global user.name "blentar"
retry_command git config --global user.email "dilan@sus"
retry_command mv ~/.gitconfig $XDG_CONFIG_HOME/git/config 

retry_command chsh -s /bin/zsh

touch ~/.cache/quicker-setup-ran
