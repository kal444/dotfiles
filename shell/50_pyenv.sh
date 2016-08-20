if [[ -e $DOTFILES/thirdparty/pyenv/bin/pyenv ]]; then
  export PATH=$DOTFILES/thirdparty/pyenv/bin:$PATH
  eval "$(pyenv init -)"
fi
