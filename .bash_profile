# .bash_profile

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$HOME/usr/bin:$PATH

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# android sdk as installed via Homebrew
export ANDROID_HOME=/usr/local/opt/android-sdk

# rbenv init - might move this to .bashrc
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
