#!/bin/bash
set -e
export Dotfiles=~/dotfiles_minimal
sudo apt-get update && sudo apt-get install -y \
      git \
      zsh \
      neovim \
      tmux \
      curl \
      xclip \
      man  \
      locales 

sudo locale-gen en_US.UTF-8

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +slient +:qall

rm -rf $HOME/.oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd $HOME

rm -rf .tmux.conf .zshrc .zshalias .config/nvim/init.vim .gitconfig

mkdir -p .config/nvim
ln -s $Dotfiles/.tmux.conf .tmux.conf
ln -s $Dotfiles/.zshrc .zshrc
ln -s $Dotfiles/.zshalias .zshalias
ln -s $Dotfiles/init.vim .config/nvim/init.vim
ln -s $Dotfiles/.gitconfig .gitconfig
