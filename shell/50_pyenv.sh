if [[ "$DISABLE_PYENV" != "1" ]]; then
  if [[ -e $DOTFILES/thirdparty/pyenv/bin/pyenv ]]; then
    export PATH=$DOTFILES/thirdparty/pyenv/bin:$PATH
    # https://github.com/yyuu/pyenv/wiki#how-to-build-cpython-with-framework-support-on-os-x
    # this is need by some tools (like YouCompleteMe plugin)
    # commenting this out for now since I'm not using YouCompleteMe anymore
    # export PYTHON_CONFIGURE_OPTS="--enable-framework"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
fi
