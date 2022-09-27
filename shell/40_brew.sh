if [[ -d ~/.linuxbrew ]]; then
  eval $(~/.linuxbrew/bin/brew shellenv)
elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
elif [[ -d /opt/homebrew ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
