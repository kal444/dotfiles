#!/bin/sh
# $Xorg: xinitrc.cpp,v 1.3 2000/08/17 19:54:30 cpqbld Exp $

xset b off &
setxkbmap -option "ctrl:nocaps" &

twm &
exec xterm -geometry 80x50+0+0 -name login
