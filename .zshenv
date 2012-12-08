# .zprofile

if [ -d ~/.terminfo ]; then
    export TERMINFO=~/.terminfo
fi

if [ -r ~/.dir_colors ]; then
    eval `dircolors --sh ~/.dir_colors`
else
    eval `dircolors --sh`
fi

export PATH=$HOME/usr/bin:$PATH

export LESS="-R -Mei -x4"
export EDITOR="vim"

