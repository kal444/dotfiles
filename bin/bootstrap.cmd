@echo off
setlocal

set DOTREPO=https://github.com/kal444/dotfiles.git
if not exist "%HOME%" set HOME=%HOMEDRIVE%%HOMEPATH%
if not exist "%HOME%" set HOME=%USERPROFILE%
set DOTFILES=%HOME%\.dotfiles

IF NOT EXIST "%DOTFILES%" (
  call git clone --recursive %DOTREPO% "%DOTFILES%"
) ELSE (
  cd /d "%DOTFILES%"
  call git pull
  call git submodule update --init --recursive --rebase --quiet
)

for /f "skip=1" %%d in ('wmic os get localdatetime') do if not defined curdatetime set curdatetime=%%d
set backupdir=%DOTFILES%\backups\%curdatetime:~0,12%
mkdir %backupdir%

REM backup files/directories
forfiles /p "%DOTFILES%\link" /c "cmd /c move %HOME%\.@file %backupdir%"

REM junction for dot directories
forfiles /p "%DOTFILES%\link" /c "cmd /c IF @isdir==TRUE  (mklink /j %HOME%\.@file @path)"
REM hard link for dot files - this avoids the need for symlink rights
forfiles /p "%DOTFILES%\link" /c "cmd /c IF @isdir==FALSE (mklink /h %HOME%\.@file @path)"
