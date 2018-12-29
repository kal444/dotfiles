case $TERM in
    xterm*|rxvt*|Eterm*|aterm*|kterm*|gnome*)
        PROMPT_COMMAND="$PROMPT_COMMAND"$'\n''echo -ne "\033]0;${PWD/$HOME/~} [${USER}@${HOSTNAME}]\007"'
        ;;
    screen*|tmux*)
        PROMPT_COMMAND="$PROMPT_COMMAND"$'\n''echo -ne "\033_${PWD/$HOME/~}\033\\"'
        ;;
    linux*)
        echo -ne "\e[?17;0;64c"
        /usr/bin/setterm -blank 0 -powersave off -powerdown 0 -blength 0 -bfreq 0
        ;;
esac
