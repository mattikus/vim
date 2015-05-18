#!/bin/sh

if [ ! -d autoload/plug.vim ]; then
   curl -fLo autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if ! (vim --version | grep -q "2nd user vimrc file"); then
    echo symlinking vimrc
    [ -L $HOME/.vimrc ] || ln -sf $HOME/.vim/vimrc $HOME/.vimrc
fi
vim +colorscheme desert +PlugInstall! +qall!
