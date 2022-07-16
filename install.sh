#!/usr/bin/bash


sudo apt update
sudo apt -y upgrade

# TODO: rewrite dependences installation
sudo apt -y install unzip
sudo apt -y install build-essential
sudo apt -y install manpages-dev

# ripgrep
sudo apt -y install ripgrep
sudo apt -y install fzf
sudo apt -y install fd-find

# zsh
# sudo apt -y install zsh
# chsh -s $(which zsh)
# touch ~/.zshrc
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# rm ~/.zshrc.pre-oh-my-zsh 

# neovim build
sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
# TODO: write a compile from 
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
sudo rm -r neovim/

# neovim config dir
mkdir -p ~/.config
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# TODO: if WSLg
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
# neovim CHADtree dependencies
sudo apt install --yes -- python3-venv

