if [[ "$DISABLE_Z" != "1" ]]; then
  if [[ -e $DOTFILES/thirdparty/z/z.sh ]]; then
    source $DOTFILES/thirdparty/z/z.sh
  fi
fi
