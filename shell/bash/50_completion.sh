# Add tab completion for many Bash commands
if [ -r /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion;
elif [ -r /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion;
elif [ -r /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

if [ -e $DOTFILES/thirdparty/git-completion/git-completion.bash ]; then
  source $DOTFILES/thirdparty/git-completion/git-completion.bash
fi
