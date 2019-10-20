if [[ "$OSTYPE" == "darwin"* ]]; then
  # on macOS, instead of ~/.cache use a location in ~/Library/Caches
  export XDG_CACHE_HOME="$HOME/Library/Caches/org.freedesktop"
  mkdir -p "${XDG_CACHE_HOME}"
fi
