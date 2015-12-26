# This file is used by all zsh login shells

PATH=/sbin:/bin
PATH=/usr/sbin:/usr/bin:$PATH
PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=$HOME/usr/sbin:$HOME/usr/bin:$PATH
export PATH

# rbenv init - might move this to .zshrc
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
