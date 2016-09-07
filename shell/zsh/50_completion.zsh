# completion options
setopt auto_name_dirs # creates named dirs automatically. TMP=/tmp, will show ~TMP anywhere /tmp would have shown
setopt complete_in_word # starting completion doesn't move cursor. complete from both ends
setopt always_to_end # Move cursor to the end of a completed word.

# add additional zsh completions
fpath=($DOTFILES/thirdparty/zsh-completions/src $fpath)

# auto completion loading and silently ignore insecure dirs
autoload -U compinit; compinit -i

# completion context string has a set of fields
# They are in the order :completion:function:completer:command:argument:tag

# enable color in your completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# matches are displayed in separate groups - group name is the tag when empty string is used
zstyle ':completion:*' group-name ''
# enable menu when more than 5 items are returned
zstyle ':completion:*' menu select=5
# lower case can match into UPPERCASE (only lower -> UPPER)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# allow one error in approximate completer
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# unambiguous first match will not start menu completion
zstyle ':completion:*:approximate:*' insert-unambiguous true
# original is always an option
zstyle ':completion:*:approximate:*' original true
# allow two errors in correct completer
zstyle ':completion:*:correct:*' max-errors 2 numeric
# original is always an option
zstyle ':completion:*:correct:*' original true

# don't complete backup files as commands
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(*\~)'
# don't complete completion functions and some bulitins as functions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:*:cd:*' ignore-parents parent pwd

# use menu completion for these commands
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:*:man:*' menu yes select

# extra verbose on completion output
zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'

# engage completers
# special setting for rm/mv. Don't guess on those commands
zstyle -e ':completion:*' completer '
  if [[ $words[1] == (rm|mv) ]] ; then
    reply=(_complete _files)
  else
    reply=(_complete _correct _approximate _files)
  fi'

# options for _history_complete_word bindable command and the _history completer
# matches are not listed
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
# all dups (not just consecutive dups) are removed
zstyle ':completion:*:history-words' remove-all-dups yes
# stop when reaching start or end of history
zstyle ':completion:*:history-words' stop yes

