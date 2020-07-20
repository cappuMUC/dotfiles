#!/bin/bash

#determine path of dotfiles repository
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER=$(dirname $SCRIPT_PATH)
POWERLINE_FONTS_PATH="https://github.com/powerline/fonts.git"

# create folder for dein.vim plugin manager
DEIN_DOT_VIM_PATH="$HOME/.vim/bundles"
mkdir -p $DEIN_DOT_VIM_PATH


#install powerline fonts
# clone
git clone $POWERLINE_FONTS_PATH
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts


# install dein.vim plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $DEIN_DOT_VIM_PATH
rm installer.sh

# create symlinks for dotfiles
ln -s $SCRIPT_FOLDER/vim/vimrc $HOME/.vimrc
ln -s $SCRIPT_FOLDER/tmux/tmux.conf $HOME/.tmux.conf
