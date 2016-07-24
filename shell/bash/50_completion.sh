# Add tab completion for many Bash commands
if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion;
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

if [ -e $DOTFILES/thirdparty/git-completion/git-completion.bash ]; then
  source $DOTFILES/thirdparty/git-completion/git-completion.bash
fi
