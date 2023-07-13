#!/bin/sh

cd ~/dotfiles

if [[ ! -L ".git/hooks" ]]; then
    mv .git/hooks .git/hooks.orig
    ln -s ../hooks .git/hooks
fi

cp -p .bash* .vim* .tmux* ~/
