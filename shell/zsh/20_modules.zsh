fpath=(~/.zfuncs $fpath)

#### built-in modules ####
zmodload zsh/complist
zmodload zsh/parameter

#### standalone modules ####
# generic accept-line wrapper
autoload -U accept-line && accept-line
zstyle ':acceptline:*' rehash true
# tmux attach or create session
autoload -U ta
# Changing a tmux sessions's default path on the fly
autoload -U cdm
[[ -n $TMUX ]] && cdm

#### additional modules/widgets ####
# run command line as user root via sudo:
function sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER != sudo\ * ]]; then
        BUFFER="sudo $BUFFER"
        CURSOR=$(( CURSOR+5 ))
    fi
}
zle -N sudo-command-line

# jump behind the first word on the cmdline.
# useful to add options.
function jump-after-first-word() {
    local words
    words=(${(z)BUFFER})

    if (( ${#words} <= 1 )) ; then
        CURSOR=${#BUFFER}
    else
        CURSOR=${#${words[1]}}
    fi
}
zle -N jump-after-first-word

# bind2maps: wrapper for bindkey
function bind2maps () {
    emulate -L zsh
    local i sequence widget
    local -a maps

    while [[ "$1" != "--" ]]; do
        maps+=( "$1" )
        shift
    done
    shift

    sequence="$1"
    widget="$2"

    [[ -z "$sequence" ]] && return 1

    for i in "${maps[@]}"; do
        builtin bindkey -M "$i" "$sequence" "$widget"
    done
}

