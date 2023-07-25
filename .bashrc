# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

# Source global definitions
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi

# append to the history file, don't overwrite it
shopt -s histappend

# Some settings ...
export TTY=`tty`
export REAL_USER=`ls -la ${TTY} | awk '{print $3}'`
export EDITOR=vim
# https://geoff.greer.fm/lscolors/
export LSCOLORS='exfxcxdxcxexexcxcxdxdx'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=32:bd=34:cd=34:su=32:sg=32:tw=33:ow=33'
export HISTTIMEFORMAT="%Y-%m-%d %T "
export GREP_OPTIONS='--color=always'

# History - don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=erasedups
export HISTFILE=~/.history_${REAL_USER}
export HISTIGNORE='ls -l:ls -la:ls:pwd:date:'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# Specific bashrc definitions
if [[ -f ~/.bashrc_local ]]; then
    . ~/.bashrc_local
fi

# My python prompt
if [[ -f ~/dotfiles/prompt.sh ]]; then
    . ~/dotfiles/prompt.sh
fi
