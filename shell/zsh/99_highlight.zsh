if [[ "$DISABLE_ZSH_SYNTAX_HIGHLIGHT" != 1 ]]; then
  source $DOTFILES/thirdparty/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $DOTFILES/thirdparty/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
fi

if [[ "$DISABLE_ZSH_AUTO_SUGGESTION" != 1 ]]; then
  source $DOTFILES/thirdparty/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=gray'
fi
