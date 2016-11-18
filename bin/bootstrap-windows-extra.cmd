@echo off
setlocal

set DOTREPO=https://github.com/kal444/dotfiles.git
if not exist "%HOME%" set HOME=%HOMEDRIVE%%HOMEPATH%
if not exist "%HOME%" set HOME=%USERPROFILE%
set DOTFILES=%HOME%\.dotfiles

del %HOME%\_vimrc
del %HOME%\_curlrc

mklink /h %HOME%\_vimrc  %DOTFILES%\link\vimrc
mklink /h %HOME%\_curlrc %DOTFILES%\link\curlrc
