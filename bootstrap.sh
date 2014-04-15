#!/bin/sh

mkdir -p bundle
if [ ! -d bundle/vundle/.git ]; then
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi
[ -L $HOME/.vimrc ] || ln -sf $HOME/.vim/vimrc $HOME/.vimrc
vim +PluginInstall! +qall!
