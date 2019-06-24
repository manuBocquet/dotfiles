#!/bin/sh

BASEDIR=$(dirname "$0")
cd $BASEDIR

if [[ ! -L ".git/hooks" ]]; then
    mv .git/hooks .git/hooks.orig
    ln -s ../hooks .git/hooks
    ./hooks/post-merge
fi
