#!/usr/bin/env bash

echo "vvv"

# run this script relative to its location e.g. ~/dotfiles/
BASEDIR=$(dirname $0)
cd $BASEDIR

# backup any existing dotfiles
PREV_DOTFILES="./bk/dotfiles_backup_$(date -u +"%Y%m%d%H%M%S")"
mkdir -p "$PREV_DOTFILES"

function backup_if_exists() {
  if [ -f $1 ];
  then
    mv $1 $PREV_DOTFILES
  fi
  if [ -d $1 ];
  then
    mv $1 $PREV_DOTFILES
  fi
}

# clean up common conflicts
backup_if_exists ~/.tmux.conf
backup_if_exists ~/.vimrc

# link new dotfiles
ln -s ${PWD}/.tmux.conf ~/.tmux.conf
ln -s ${PWD}/.vimrc ~/.vimrc

echo "^^^"
