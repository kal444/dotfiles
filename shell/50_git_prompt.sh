if [[ "$DISABLE_GIT_PROMPT" != "1" ]]; then
  if [[ -e $DOTFILES/thirdparty/git-prompt/git-prompt.sh ]]; then
    GIT_PS1_SHOWUNTRACKEDFILES=yes
    GIT_PS1_SHOWDIRTYSTATE=yes
    GIT_PS1_SHOWSTASHSTATE=yes
    GIT_PS1_SHOWUPSTREAM=verbose
    source $DOTFILES/thirdparty/git-prompt/git-prompt.sh
  fi
fi
