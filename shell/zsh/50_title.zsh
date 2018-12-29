# xterm and rxvt title setting
case $TERM in
    xterm*|rxvt*|Eterm*|aterm*|kterm*|gnome*)
        precmd() {
            # OK, this needs some documentaions, ]0 chooses title and icon title
            echo -ne "\033]0;${PWD/$HOME/~} [${USER}@${HOST}]\007"
        }
        ;;
    screen*|tmux*)
        precmd() {
            # this clears the program running status and reset it to pwd
            echo -ne "\033kzsh\033\\" # clear title string
            echo -ne "\033_${PWD/$HOME/~}\033\\" # set hardstatus
        }
        preexec() {
            # this sets the title string to the program that will run
            echo -ne "\033k${1}\033\\" # set title string
        }
        ;;
    linux*)
        echo -ne "\e[?17;0;64c"
        /usr/bin/setterm -blank 0 -powersave off -powerdown 0 -blength 0 -bfreq 0
        ;;
esac
