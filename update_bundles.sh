#!/bin/bash
# Updates submodules in bundle subdirectory

GIT=$(which git)
if [ $? -ne 0 ]; then
  echo 'This script requires git.'
  exit 1
else
  (cd $(dirname $0) && $GIT submodule foreach $GIT pull origin master)
  echo -e "\nDon't forget to add and commit new changes."
fi
