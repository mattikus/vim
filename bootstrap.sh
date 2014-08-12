#!/bin/sh

mkdir -p bundle
if [ ! -d bundle/vundle/.git ]; then
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi
if ! (vim --version | grep -q "2nd user vimrc file"); then
    echo symlinking vimrc
    [ -L $HOME/.vimrc ] || ln -sf $HOME/.vim/vimrc $HOME/.vimrc
fi
vim +PluginInstall! +qall!
