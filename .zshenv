# Keep this small
# This file is used by all zsh shells
# Only configurations applying to all 
# shells (login, interactive, normal) should go here

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$HOME/usr/bin:$PATH

# android sdk as installed via Homebrew
export ANDROID_HOME=/usr/local/opt/android-sdk

# rbenv init - might move this to .zshrc
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
