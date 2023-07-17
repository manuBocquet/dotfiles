#!/bin/sh

cd ~/dotfiles

if [[ ! -L ".git/hooks" ]]; then
    if [[ -e ".git/hooks" ]]; then
        /bin/mv .git/hooks .git/hooks.orig
    fi
    /bin/ln -s ../hooks .git/hooks
fi

/bin/cp -p .bash* .vimrc .gitconfig .tmux* ~/

#if [[ ! -h "$HOME/.vim" ]]; then
#    if [[ -e "~/.vim" ]]; then
#        /usr/bin/mv ~/.vim ~/.vim.orig
#    fi
#    /usr/bin/ln -s ~/dotfiles/.vim ~/.vim
#fi
