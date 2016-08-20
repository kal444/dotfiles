# define aliases for zsh only
#
alias mkdir='nocorrect mkdir'
if [ `/usr/bin/id -u` -ne 0 ]; then
  # stop spell correction for file operations
  alias cp='nocorrect cp'
  alias rm='nocorrect rm'
  alias mv='nocorrect mv'
fi
