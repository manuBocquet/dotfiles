#!/bin/sh

BASEDIR=$(dirname "$0")
PIP="pip3"

cd ~
if [[ -f ".bashrc_local" ]];then
    source ~/.bashrc_local
fi

if [[ $EUID -eq 0 ]]; then
    command -v $PIP >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        command -v powerline-daemon >/dev/null 2>&1
        if [[ $? -ne 0 ]]; then
            echo "pip install powerline-status"
            $PIP install powerline-status
        fi
    else
        echo "$PIP not found !"
    fi
fi

cd ~/dotfiles

if [[ ! -L ".git/hooks" ]]; then
    mv .git/hooks .git/hooks.orig
    ln -s ../hooks .git/hooks
fi

./hooks/post-merge
