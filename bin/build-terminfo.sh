#!/bin/sh

curl -O https://invisible-mirror.net/archives/ncurses/terminfo.src.gz
gunzip terminfo.src.gz
tic terminfo.src
rm terminfo.src
