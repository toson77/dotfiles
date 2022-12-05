#!/bin/bash

# symlink

# change server
perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list
# vimplug install
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo apt install ripgrep fzf

#package install
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential -y

#install n
sudo apt-get update
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo npm install -g n
sudo n lts
sudo apt-get purge nodejs npm -y

#install python3 pyenv
sudo apt-get update
sudo apt-get install gcc zlib1g-dev libffi-dev libbz2-dev libssl-dev libreadline-dev libsqlite3-dev python3-tk tk-dev -y
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update

#install pynvim
pyenv install 3.7.4
pyenv shell neovim3
pip install pynvim

#install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cargo-edit
cargo install cargo-watch
cargo install evcxr_repl
cargo install ripgrep

#install haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
