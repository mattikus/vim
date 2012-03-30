#!/bin/sh
# Updates submodules in bundle subdirectory

GIT=$(which git)
if [ $? -ne 0 ]; then
  echo 'This script requires git.'
  exit 1
else
  cd $(dirname $0)
  status=$($GIT submodule status | awk '{ print substr($1,0,1) } NR>0 { exit }')
  if [ $status == '-' ]; then
    $GIT submodule init && $GIT submodule update
  fi
  $GIT submodule foreach $GIT pull origin master
  echo -e "\nDon't forget to add and commit new changes."
fi
