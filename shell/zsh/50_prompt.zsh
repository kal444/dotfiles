# prompt options
setopt prompt_subst # allow some expansions in prompt strings
setopt transient_rprompt # remove r-prompts when running commands - easier copy/paste

# Set up color prompt
autoload -U colors; colors;

#PS1="$(print '%{\e[0;31m%}[%{\e[0;36m%}%3~%{\e[0;31m%}] %#%{\e[0m%} ')"
#RPS1="$(print ' %{\e[0;33m%}%n%{\e[0;31m%}@%{\e[0;33m%}%m%{\e[0;31m%}:%{\e[0;32m%}%y%{\e[0m%}')"
PS1="%{$fg[red]%}[%{$fg[cyan]%}%3~%{$fg[red]%}] %#%{$reset_color%} "
RPS1=" %{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[yellow]%}%m%{$fg[red]%}:%{$fg[green]%}%y%{$reset_color%}"
