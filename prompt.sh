#!/bin/bash

# https://mcdlr.com/utf-8/#8901
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://www.fileformat.info/info/charset/UTF-8/list.htm?start=8192

function set_bash_prompt(){
  ERROR=$?
  COLS=$(tput cols)
  PS1=$(~/dotfiles/prompt.py $COLS $ERROR)
  if [ $? -ne 0 ]; then
    PS1="$ "
  fi
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
