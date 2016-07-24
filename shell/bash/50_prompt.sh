function __set_prompt_command() {
  local  reset='\[\e[0m\]'
  local  black='\[\e[0;30m\]'
  local    red='\[\e[0;31m\]'
  local  green='\[\e[0;32m\]'
  local yellow='\[\e[0;33m\]'
  local   blue='\[\e[0;34m\]'
  local purple='\[\e[0;35m\]'
  local   cyan='\[\e[0;36m\]'
  local  white='\[\e[0;37m\]'

  local userhost="${yellow}\u${red}@${yellow}\h"
  local workdir="${cyan}\w"
  local gitstat='$(__git_ps1 " (%s)")'
  local time="${cyan}\t"

  PS1="${red}[${userhost} ${workdir}${red}]${blue}${gitstat}\n${red}[${time}${red}] ${red}\\$ ${reset}"
}
__set_prompt_command
