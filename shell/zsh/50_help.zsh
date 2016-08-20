# enable online help
export HELPDIR=/usr/local/share/zsh/help

[[ -e ${aliases[run-help]} ]] && unalias run-help
autoload -U run-help
autoload run-help-git
