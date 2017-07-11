#!/bin/bash

for file in `ls -d .[a-z]*|grep -v git` 
do
	if [ -f ~/${file} ]; then
		if [ ! -h ~/${file} ]; then
			mv ~/${file} ~/${file}".old"
			ln -s ~/dotfiles/${file} ~/${file}
		fi
	else
		ln -s ~/dotfiles/${file} ~/${file}
	fi
done
