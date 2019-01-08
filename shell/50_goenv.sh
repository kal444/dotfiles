if [[ "$DISABLE_GOENV" != "1" ]]; then
  if [[ -e $DOTFILES/thirdparty/goenv/bin/goenv ]]; then
    export PATH=$DOTFILES/thirdparty/goenv/bin:$PATH
    eval "$(goenv init -)"
  fi
fi
