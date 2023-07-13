#------------------------------------------------------------------------
# Enable powerline if installed 

LC_ALL=en_US.UTF-8; export LC_ALL
LANG=en_US.UTF-8; export LANG

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
    BASH_ENV=~/.bashrc; export BASH_ENV
fi
