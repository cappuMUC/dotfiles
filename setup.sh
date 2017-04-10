#!/bin/bash

LOCAL_DIR=$('pwd');
DEIN_DOT_VIM_PATH="$HOME/.vim/bundles"

mkdir -p $DEIN_DOT_VIM_PATH


#install powerline fonts
# clone
git clone https://github.com/powerline/fonts.git
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
ln -s $LOCAL_DIR/vim/vimrc $HOME/.vimrc
ln -s $LOCAL_DIR/tmux/tmux.conf $HOME/.tmux.conf
