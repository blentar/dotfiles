#! /bin/sh

# noob dont judge

# bash -c "$(wget -qO https://raw.githubusercontent.com/blentar/dotfiles/master/.scripts/quicker-setup-termux.sh"

echo "Setting up storage . . ."
if termux-setup-storage ; then echo "Done." ; else echo "Failed." ; fi

echo "Moving bash stuff out of my home . . ."
mkdir .config/bash_bak
[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.config/bash/
[ -f "$HOME/.bash_profile" ] && mv ~/.bash_profile ~/.config/bash/

echo "Updating and Installing some packages . . ."
if pkg update ; then echo "Done." ; else echo "Failed." ; fi

echo "Cloning ZSH plugins . . ."
mkdir -p ~/.config/zsh
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh/plugins/fast-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab ~/.config/zsh/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-completions ~/.config/zsh/plugins/zsh-completions

echo "Installing fzf with git . . ."
mkdir -p ~/.config/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/zsh/plugins/fzf
~/.config/zsh/plugins/fzf/install --xdg --key-bindings --completion --no-update-rc

echo "Adding dotfiles . . ."
mkdir -p ~/.config/git
echo ".dotfiles" >> ~/.config/git/ignore
git clone --bare https://github.com/blentar/dotfiles .dotfiles
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" checkout
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/" config --local status.showUntrackedFiles no

git config --global user.name "blentar"
git config --global user.email "dilan@sus"
mv ~/.gitconfig $XDG_CONFIG_HOME/git/config 

chsh -s /bin/zsh
