#!/usr/bin/env bash

# exit if a command returns non-zero (prevent snowballing)
set -e

echo "vvv"

# run this script relative to its location e.g. ~/dotfiles/
BASEDIR=$(dirname $0)
cd $BASEDIR

# machine specific stuff
if uname | grep Darwin; then
  echo running OS X
elif uname --kernel-release | grep WSL2; then
  # use git for windows credential manager
  git config --file ./.gitconfig credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
elif uname | grep Linux; then
  echo running Linux
fi

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
backup_if_exists ~/.zshrc
backup_if_exists ~/.vimrc
backup_if_exists ~/.ideavimrc
backup_if_exists ~/.tmux.conf
backup_if_exists ~/.gitconfig
backup_if_exists ~/.hammerspoon/init.lua

# link new dotfiles
ln -sv ${PWD}/.zshrc ~/.zshrc
ln -sv ${PWD}/.vimrc ~/.vimrc
ln -sv ${PWD}/.ideavimrc ~/.ideavimrc
ln -sv ${PWD}/.tmux.conf ~/.tmux.conf
ln -sv ${PWD}/.gitconfig ~/.gitconfig
ln -sv ${PWD}/.hammerspoon/init.lua ~/.hammerspoon/init.lua

echo "^^^"
