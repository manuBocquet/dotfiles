#!/bin/sh

cd ~/dotfiles

if [[ ! -L ".git/hooks" ]]; then
    if [[ -e ".git/hooks" ]]; then
        /bin/mv .git/hooks .git/hooks.orig
    fi
    /bin/ln -s ../hooks .git/hooks
fi

/bin/cp -p .bash* .vimrc .gitconfig .tmux* ~/
source ~/.bashrc
