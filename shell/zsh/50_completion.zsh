# completion options
setopt auto_name_dirs # creates named dirs automatically. TMP=/tmp, will show ~TMP anywhere /tmp would have shown
setopt complete_in_word # starting completion doesn't move cursor - not sure what this means

# auto completion
autoload -U compinit; compinit

# allow approximate
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' menu yes select
