fpath=(~/.zfuncs $fpath)
zmodload zsh/complist
zmodload zsh/parameter

autoload -U accept-line && accept-line
zstyle ':acceptline:*' rehash true
