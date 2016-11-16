@echo off
setlocal

set DOTREPO=https://github.com/kal444/dotfiles.git
REM if not exist "%HOME%" set HOME=%HOMEDRIVE%%HOMEPATH%
REM what if I don't want to use the network home drive?
if not exist "%HOME%" set HOME=%USERPROFILE%
set DOTFILES=%HOME%/.dotfiles

IF NOT EXIST "%DOTFILES%" (
  call git clone --recursive %DOTREPO% "%DOTFILES%"
) ELSE (
  cd /d "%DOTFILES%"
  call git pull
  call git submodule update --init --recursive --remote --merge --quiet
)

