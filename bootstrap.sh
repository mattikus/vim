#!/bin/sh

set -euo pipefail

if which nvim &>/dev/null; then
    vimprg=nvim
    vimpath=$HOME/.nvim
else
    vimprg=vim
    vimpath=$HOME/.vim
fi

if [ ! -f ${vimpath}/autoload/plug.vim ]; then
    curl -fLo ${vimpath}/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    if [[ "$vimprg" == "vim" ]] && \
        ! ($vimprg --version | grep -q "2nd user vimrc file"); then
        echo symlinking vimrc
        [ -L $HOME/.vimrc ] || ln -sf $HOME/.vim/vimrc $HOME/.vimrc
    fi

    $vimprg +PlugInstall! +qall!
else
    $vimprg +PlugUpdate +qall!
fi
