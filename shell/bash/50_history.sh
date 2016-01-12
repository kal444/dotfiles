# History settings

# append history
shopt -s histappend
# Allow use to re-edit a faild history substitution.
shopt -s histreedit
# History expansions will be verified before execution.
shopt -s histverify

# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
HISTCONTROL="ignorespace:erasedups"
# Give history timestamps.
HISTTIMEFORMAT="[%F %T] "
# Lots o' history.
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE
HISTFILE=~/.bash_history
