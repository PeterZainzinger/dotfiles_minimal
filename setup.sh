#!/bin/bash

Dotfiles=~/dotfiles_minimal
sudo apt-get update && apt-get install -y \
      git \
      zsh \
      neovim \
      tmux \
      curl \
      xclip \
      man  \
      locales 

locale-gen en_US.UTF-8
export LANG en_US.UTF-8
export LANGUAGE en_US:en
export LC_ALL en_US.UTF-8

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
     vim +PlugInstall +slient +:qall

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd $HOME

rm -rf .tmux.conf  .zshrc .zshalias .config/nvim/init.vim 

mkdir -p .config/nvim
ln -s $Dotfiles/.tmux.conf .tmux.conf
ln -s $Dotfiles/.zshrc .zshrc
ln -s $Dotfiles/.zlogin .zlogin
ln -s $Dotfiles/.zshalias .zshalias
ln -s $Dotfiles/.nvimrc .config/nvim/init.vim
