# completion options
setopt auto_name_dirs # creates named dirs automatically. TMP=/tmp, will show ~TMP anywhere /tmp would have shown
setopt complete_in_word # starting completion doesn't move cursor. complete from both ends
setopt always_to_end # Move cursor to the end of a completed word.

# add additional zsh completions
fpath=($DOTFILES/thirdparty/zsh-completions/src $fpath)

# auto completion loading and silently ignore insecure dirs
autoload -U compinit; compinit -i

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Ignore completion functions for commands you don’t have:
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:*:cd:*' ignore-parents parent pwd

# kill will use menu completion
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' menu yes select
