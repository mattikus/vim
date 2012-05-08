#!/bin/sh

mkdir -p bundle
if [ ! -d bundle/vundle/.git ]; then
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi
vim -u bundles.vim +BundleInstall +qall!
