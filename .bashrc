# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
TTY=`tty`
REAL_USER=`ls -la ${TTY} | awk '{print $3}'`
HISTFILE=~/.history_${REAL_USER}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Specific bashrc definitions

if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

PIP="pip3.6"
if [[ -f "~/.dotfiles" ]];then
    . ~/.dotfiles
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#------------------------------------------------------------------------
# Enable powerline if installed 

command -v $PIP >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
    repository_root=$($PIP show powerline-status 2>/dev/null | awk '/Location:/ {print $2}')
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . ${repository_root}/powerline/bindings/bash/powerline.sh
else
    echo "$PIP/powerline not found"
    EE=""
    if [ "$color_prompt" = yes ]; then
        PS1='\[\033[01;31m\]${EE}\[\033[00m\][\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
    else
        PS1='${EE}\u@\h:\w \$ '
    fi
unset color_prompt force_color_prompt
fi



