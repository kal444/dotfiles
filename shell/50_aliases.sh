# define shared aliases for 
# both bash and zsh
#
if [ `/usr/bin/id -u` -eq 0 ]; then
  # force interactive file operations for root
  alias cp='cp -i'
  alias rm='rm -i'
  alias mv='mv -i'
fi

# humanize file sizes
alias du='du -h'
alias df='df -h'
alias ls='ls -h -Fb'
alias la='ls -a'
alias ll='ls -l'
alias lla='ll -a'
alias dir='ll'
alias tree='tree -h -xF'

# colorize greps
alias grep='egrep --color=auto'
alias egrep='egrep --color=auto'

alias more='less'
alias vi='vim'

alias ftp='ftp -i'
alias irb='irb --readline -r irb/completion --prompt simple'

alias d='docker'
alias dm='docker-machine'
