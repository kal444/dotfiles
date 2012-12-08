# .bashrc

if [ "`id -gn`" = "`id -un`" -a `id -u` -gt 99 ]; then
    umask 002
else
    umask 022
fi

# stop if not interactive shell?
[ -z "$PS1" ] && return

case $TERM in
xterm*|rxvt*|Eterm|aterm|kterm|gnome)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~} [${USER}@${HOSTNAME}]\007"'
;;
screen)
    PROMPT_COMMAND='echo -ne "\033_${PWD/$HOME/~}\033\\"'
;;
linux*)
    echo -ne "\e[?17;0;64c"
    /usr/bin/setterm -blank 0 -powersave off -powerdown 0 -blength 0 -bfreq 0
;;
esac

# Set up color prompt
PS1="\[\e[0;31m\][\[\e[0;33m\]\u\[\e[0;31m\]@\[\e[0;33m\]\h \[\e[0;36m\]\W\[\e[0;31m\]]\\$ \[\e[0m\]"

# Setting some variables regarding history
HISTSIZE=1000
HISTFILESIZE=$HISTSIZE
HISTFILE=~/.bash_history
HISTCONTROL=ignoreboth

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# shell options
set -o noclobber

shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s histappend
shopt -s no_empty_cmd_completion

# use vi style line editting
set -o vi

# key input setup
if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ]; then
    INPUTRC=/etc/inputrc
fi

# alias def
if [ `/usr/bin/id -u` -eq 0 ]; then
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
fi

alias du='du -h'
alias df='df -h'
alias ftp='ftp -i'
alias grep='grep -E --color=auto'
alias irb='irb --readline -r irb/completion --prompt simple'
alias job='jobs -l'
alias ll='/bin/ls -abhlF --color=auto'
alias ls='/bin/ls -abhF --color=auto'
alias more='less'
alias pstree='pstree -hul'
alias screen='screen -DR'
alias vi='vim'
alias w='w -fu'
alias who='who -HTu'

