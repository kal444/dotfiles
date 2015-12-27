export EDITOR="vim"
export LESS="-R -Mei -x4"
export CLICOLOR=1 # for ls color output

# set a more permissive umask for normal users with primary group of the same name
if [ "`id -gn`" = "`id -un`" -a `id -u` -gt 99 ]; then
    umask 002
else
    umask 022
fi

# xterm and rxvt title setting
case $TERM in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome)
        precmd() {
            # OK, this needs some documentaions, ]0 chooses title and icon title
            echo -ne "\033]0;${PWD/$HOME/~} [${USER}@${HOST}]\007"
        }
        ;;
    screen)
        precmd() {
            # this clears the program running status and reset it to pwd
            echo -ne "\033kzsh\033\\" # clear title string
            echo -ne "\033_${PWD/$HOME/~}\033\\" # set hardstatus
        }
        preexec() {
            # this sets the title string to the program that will run
            echo -ne "\033k${1}\033\\" # set title string
        }
        ;;
    linux*)
        echo -ne "\e[?17;0;64c"
        /usr/bin/setterm -blank 0 -powersave off -powerdown 0 -blength 0 -bfreq 0
        ;;
esac

# Set up color prompt
autoload -U colors; colors;
#PS1="$(print '%{\e[0;31m%}[%{\e[0;36m%}%3~%{\e[0;31m%}] %#%{\e[0m%} ')"
#RPS1="$(print ' %{\e[0;33m%}%n%{\e[0;31m%}@%{\e[0;33m%}%m%{\e[0;31m%}:%{\e[0;32m%}%y%{\e[0m%}')"
PS1="%{$fg[red]%}[%{$fg[cyan]%}%3~%{$fg[red]%}] %#%{$reset_color%} "
RPS1=" %{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[yellow]%}%m%{$fg[red]%}:%{$fg[green]%}%y%{$reset_color%}"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# pushd directory size
DIRSTACKSIZE=100

configure_options() {
  # change directories
  setopt auto_cd # type directory name to cd to it
  setopt auto_pushd # cd does a pushd
  setopt cdable_vars # type cd username/blah to do cd ~username/blah
  setopt pushd_ignore_dups
  setopt pushd_to_home # just pushd with no arg behaves like cd with no arg
  # completion
  setopt auto_name_dirs # creates named dirs automatically. TMP=/tmp, will show ~TMP anywhere /tmp would have shown
  setopt complete_in_word # starting completion doesn't move cursor - not sure what this means
  # expansion and globbing
  setopt extended_glob # adds ~/^/# to file glob patterns - this can get crazy
  # history
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
  # input/output
  setopt no_clobber # don't overwrite file automatically
  setopt correct # correct commands
  setopt correct_all # correct parameters
  setopt no_ignore_eof # allow me to end shell with ^D
  setopt print_exit_value # print non-zero exit values
  setopt no_rm_star_silent # safer rm * or rm path/*
  # job control
  setopt long_list_jobs # use long format
  # prompting
  setopt prompt_subst # allow some expansions in prompt strings
  setopt transient_rprompt # remove r-prompts when running commands - easier copy/paste
  # zle
  setopt no_beep # don't want beeps!
}
configure_options

# auto completion
autoload -U compinit; compinit

# allow approximate
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' menu yes select

configure_bindings() {
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
  bindkey '^[[A' up-line-or-search # up does search based on prefix
  bindkey '^[[B' down-line-or-search # down does search based on prefix
  bindkey '^[[C' forward-char # right
  bindkey '^[[D' backward-char # left
  bindkey '^H' backward-delete-char # backspace always works - allows backspace over insert point in vi mode
  bindkey '^?' backward-delete-char # backspace always works - allows backspace over insert point in vi mode
  # remove the ESC-/ binding as it interferes with vi search
  bindkey -r "^[/"
}
configure_bindings

# enable online help
unalias run-help
autoload -U run-help
HELPDIR=/usr/local/share/zsh/5.0.5/help

source $HOME/Repos/z/z.sh

save_configs() {
    /bin/tar cfz ._configs.tar.gz \
            .bash_profile .bashrc .inputrc \
            .zshenv .zshrc \
            .vimrc .gvimrc \
            .screenrc \
            .toprc \
            .xinitrc
}
