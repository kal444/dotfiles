# history variables
HISTFILE=${ZDOTDIR:-${HOME}}/.zsh_history
HISTSIZE=5000
SAVEHIST=10000

# history options
setopt extended_history # adds more timing info to history file
setopt hist_expire_dups_first # don't want dups
setopt hist_find_no_dups # don't want dups
setopt hist_ignore_all_dups # don't want dups
setopt hist_ignore_dups # don't want dups
setopt hist_ignore_space # space prefix will not save in history
setopt hist_no_store # history command itself is not saved
setopt hist_reduce_blanks # remove extra spaces
setopt hist_save_no_dups # don't want dups
setopt hist_verify # history expansion will show the line - before running it
setopt inc_append_history # periodically add to history
setopt share_history # imports commands from saved history file (e.g. another session?)

# history keys
bindkey '^[[A' up-line-or-search # up does search based on prefix
bindkey '^[[B' down-line-or-search # down does search based on prefix
# remove the ESC-/ binding as it interferes with vi search
bindkey -r "^[/"
