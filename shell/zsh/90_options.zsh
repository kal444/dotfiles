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

# list key maps in order of emacs vicmd viins like in the man page
bind2maps emacs       viins -- ' ' magic-space

bind2maps emacs       viins -- '^[[Z' reverse-menu-complete

bind2maps emacs vicmd viins -- '^of' jump-after-first-word
bind2maps emacs vicmd viins -- '^oh' run-help
bind2maps emacs vicmd viins -- '^os' sudo-command-line

bind2maps emacs vicmd viins -- '^ot' words-from-tmux-pane
bind2maps emacs vicmd viins -- '^o^t' words-from-tmux-pane-anywhere

bind2maps emacs vicmd viins -- "^p" history-search-backward
bind2maps emacs vicmd viins -- "^n" history-search-forward

