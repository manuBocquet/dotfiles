#!/bin/sh

cd ~/dotfiles

if [[ ! -L ".git/hooks" ]]; then
    if [[ -e ".git/hooks" ]]; then
        /usr/bin/mv .git/hooks .git/hooks.orig
    fi
    /usr/bin/ln -s ../hooks .git/hooks
fi

/usr/bin/cp -p .bash* .vimrc .tmux* ~/

#if [[ ! -h "$HOME/.vim" ]]; then
#    if [[ -e "~/.vim" ]]; then
#        /usr/bin/mv ~/.vim ~/.vim.orig
#    fi
#    /usr/bin/ln -s ~/dotfiles/.vim ~/.vim
#fi
