if [[ -e $DOTFILES/thirdparty/git-prompt/git-prompt.sh ]]; then
  GIT_PS1_SHOWUNTRACKEDFILES=yes
  GIT_PS1_SHOWDIRTYSTATE=yes
  GIT_PS1_SHOWSTASHSTATE=yes
  source $DOTFILES/thirdparty/git-prompt/git-prompt.sh
fi
