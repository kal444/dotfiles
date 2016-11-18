has_command vi && export EDITOR="vi"
has_command vim && export EDITOR="vim"
export VISUAL="$EDITOR"

has_command more && export PAGER="more"
has_command less && export PAGER="less"

export LESS="-Fe -RX -M -i -x4"
export LESSEDIT="$EDITOR ?lm+%lm -- %f"

if ls --color=auto -d . >/dev/null 2>&1; then
  # echo "has GNU ls"
  eval $(dircolors -b $DOTFILES/thirdparty/LS_COLORS/LS_COLORS)
elif has_command gls; then
  # echo "has GNU ls as gls"
  eval $(gdircolors -b $DOTFILES/thirdparty/LS_COLORS/LS_COLORS)
else
  # echo "probably has BSD ls"
  export CLICOLOR=1 # for BSD ls color output
  export LSCOLORS="exfxcxdxbxegedabagacad"
fi
