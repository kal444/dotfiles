# .zshrc

if [ "`id -gn`" = "`id -un`" -a `id -u` -gt 99 ]; then
    umask 002
else
    umask 022
fi

# xterm and rxvt title setting
case ${TERM} in
(xterm*|rxvt*|Eterm|aterm|kterm|gnome)
precmd() {
    # OK, this needs some documentaions, ]0 chooses title and icon title
    # , is used to delimit substitution.
    echo -ne "\033]0;${PWD/$HOME/~} [${USER}@${HOST}]\007"
}
;;
(screen)
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
(linux*)
    echo -ne "\e[?17;0;64c"	
    /usr/bin/setterm -blank 0 -powersave off -powerdown 0 -blength 0 -bfreq 0
;;
esac

# Set up color prompt
PS1="$(print '%{\e[0;31m%}[%{\e[0;36m%}%3~%{\e[0;31m%}] %#%{\e[0m%} ')"
RPS1="$(print ' %{\e[0;33m%}%n%{\e[0;31m%}@%{\e[0;33m%}%m%{\e[0;31m%}:%{\e[0;32m%}%y%{\e[0m%}')"

# Setting some variables
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

DIRSTACKSIZE=10

# options
setopt    always_to_end
setopt    append_history
setopt no_auto_cd
setopt    auto_list
setopt    auto_menu
setopt no_auto_name_dirs
setopt    auto_param_keys
setopt    auto_param_slash
setopt    auto_pushd
setopt    auto_remove_slash
setopt no_auto_resume
setopt no_bg_nice
setopt no_cdable_vars #enabling this will enable cd matching to username too
setopt no_clobber
setopt    correct
setopt no_correct_all
setopt    hist_find_no_dups
setopt    hist_ignore_all_dups
setopt    hist_ignore_dups
setopt    hist_ignore_space
setopt    hist_no_store
setopt    hist_reduce_blanks
setopt    hist_save_no_dups
setopt no_ignore_eof
setopt    list_types
setopt    long_list_jobs
setopt    multios
setopt no_notify
setopt no_overstrike
setopt    print_exit_value
setopt    pushd_ignore_dups
setopt    pushd_to_home
setopt no_rec_exact
setopt no_rm_star_silent
setopt no_single_line_zle
setopt    zle

# key bindings
bindkey ' ' magic-space # makes space do some cool things in shell
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[2~' quoted-insert
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey '^[[D' backward-char

# use vi style zle keys
bindkey -v

# auto completion
autoload -U compinit; compinit

# allow approximate
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' menu yes select

# remove the ESC-/ binding as it interferes with vi search
bindkey -r "^[/"
bindkey "^[." _history-complete-older

# alias def
if [ `/usr/bin/id -u` -eq 0 ]; then
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
fi

alias cp='nocorrect cp'
alias du='du -h'
alias df='df -h'
alias ftp='ftp -i'
alias grep='grep -E --color=auto'
alias irb='irb --readline -r irb/completion --prompt simple'
alias job='jobs -l'
alias ll='/bin/ls -abhlF --color=auto'
alias ls='/bin/ls -abhF --color=auto'
alias mkdir='nocorrect mkdir'
alias more='less'
alias mv='nocorrect mv'
alias pstree='pstree -hul'
alias repo='cd ~/projects/gitrepos'
alias screen='screen -DR'
alias vi='vim'
alias w='w -fu'
alias who='who -HTu'

save_configs() {
    /bin/tar cfz ._configs.tar.gz \
            .bash_profile .bashrc .inputrc \
            .zshenv .zshrc \
            .vimrc .gvimrc \
            .screenrc \
            .toprc \
            .xinitrc
}

