function has_command() {
  command -v "$@" >/dev/null 2>&1;
}
