#!/bin/bash

# VARIABLES
# -----------------------------------------------------------------------------

# determine path of dotfiles repository
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER=$(dirname $SCRIPT_PATH)
POWERLINE_FONTS_PATH="https://github.com/powerline/fonts.git"


# INSTALLERS
# -----------------------------------------------------------------------------

# install powerline fonts
# clone
git clone $POWERLINE_FONTS_PATH
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts


# LINKING
# -----------------------------------------------------------------------------

# create symlinks for dotfiles
ln -s $SCRIPT_FOLDER/vim/vimrc $HOME/.vimrc
ln -s $SCRIPT_FOLDER/tmux/tmux.conf $HOME/.tmux.conf
