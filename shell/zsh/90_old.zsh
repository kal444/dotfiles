# pushd directory size
DIRSTACKSIZE=100

# change directories
setopt auto_cd # type directory name to cd to it
setopt auto_pushd # cd does a pushd
setopt cdable_vars # type cd username/blah to do cd ~username/blah
setopt pushd_ignore_dups
setopt pushd_to_home # just pushd with no arg behaves like cd with no arg
# expansion and globbing
setopt extended_glob # adds ~/^/# to file glob patterns - this can get crazy
# input/output
setopt no_clobber # don't overwrite file automatically
setopt correct # correct commands
setopt correct_all # correct parameters
setopt no_ignore_eof # allow me to end shell with ^D
setopt print_exit_value # print non-zero exit values
setopt no_rm_star_silent # safer rm * or rm path/*
# job control
setopt long_list_jobs # use long format
# zle
setopt no_beep # don't want beeps!

# key bindings
# use vi style zle keys
bindkey -v
# overrides
bindkey ' ' magic-space # makes space do history expansion
bindkey '^[[1~' beginning-of-line # home key
bindkey '^[[4~' end-of-line # end key
bindkey '^[[2~' quoted-insert # insert key
bindkey '^[[3~' delete-char # delete key
bindkey '^[[5~' up-line-or-search # page up
bindkey '^[[6~' down-line-or-search # page down
bindkey '^[[C' forward-char # right
bindkey '^[[D' backward-char # left
