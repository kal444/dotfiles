#!/bin/sh

curl -O https://invisible-island.net/datafiles/current/terminfo.src.gz
gunzip terminfo.src.gz
tic terminfo.src
rm terminfo.src
