# prompt options
setopt prompt_subst # allow some expansions in prompt strings
setopt transient_rprompt # remove r-prompts when running commands - easier copy/paste

# Set up color prompt
autoload -U colors; colors;

#PS1="$(print '%{\e[0;31m%}[%{\e[0;36m%}%3~%{\e[0;31m%}] %#%{\e[0m%} ')"
#RPS1="$(print ' %{\e[0;33m%}%n%{\e[0;31m%}@%{\e[0;33m%}%m%{\e[0;31m%}:%{\e[0;32m%}%y%{\e[0m%}')"
if [[ "$DISABLE_GIT_PROMPT" != "1" ]]; then
  PS1='%{$fg[red]%}[%{$fg[cyan]%}%~%{$fg[red]%}]%{$fg[blue]%}$(__git_ps1 " (%s)")%{$reset_color%}
%{$fg[red]%}[%{$fg[cyan]%}%*%{$fg[red]%}]%{$fg[blue]%}(%?) %{$fg[red]%}%#%{$reset_color%} '
else
  PS1='%{$fg[red]%}[%{$fg[cyan]%}%~%{$fg[red]%}]%{$reset_color%}
%{$fg[red]%}[%{$fg[cyan]%}%*%{$fg[red]%}]%{$fg[blue]%}(%?) %{$fg[red]%}%#%{$reset_color%} '
fi
RPS1=' %{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[yellow]%}%m%{$fg[red]%}:%{$fg[green]%}%l%{$reset_color%}'

# secondary prompt, printed when the shell needs more information to complete a command.
PS2='\`%_> '

# selection prompt used within a select loop.
PS3='?# '

# the execution trace prompt (setopt xtrace). default: '+%N:%i>'
PS4='+%N:%i:%_> '

