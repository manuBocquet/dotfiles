#------------------------------------------------------------------------
# Enable powerline if installed 

PIP="pip3"
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

command -v $PIP >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
    repository_root=$($PIP show powerline-status 2>/dev/null | awk '/Location:/ {print $2}')
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . ${repository_root}/powerline/bindings/bash/powerline.sh
    unset color_prompt force_color_prompt
    export POWERLINE_BASH_SELECT repository_root POWERLINE_BASH_CONTINUATION
fi

if [[ -f $HOME/.bashrc ]]; then
    source $HOME/.bashrc
fi
