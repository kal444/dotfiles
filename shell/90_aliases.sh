# define shared aliases for 
# both bash and zsh
#

has_command ip && default_iface=$(ip -o -4 route show to default | awk '{print $5}')
has_command route && route get default >/dev/null 2>&1 && default_iface=$(route get default | grep interface: | awk '{print $2}')

if ls --version >/dev/null 2>&1; then
  # echo "has GNU ls"
  alias ls='command ls --color=auto -h -Fb --group-directories-first'
elif has_command gls; then
  # echo "has GNU ls as gls"
  alias ls='command gls --color=auto -h -Fb --group-directories-first'
else
  # echo "probably has BSD ls"
  alias ls='command ls -h -Fb'
fi

# humanize file sizes
alias du='du -hx'
alias df='df -h'
alias la='ls -A'
alias ll='ls -l'
alias lla='ll -A'
alias dir='ll'
alias tree='tree -h -Fx --dirsfirst'

# allow sudo on aliases
alias sudo='sudo '

# week number
alias week='date +%V'

# command overrides
has_command egrep && alias grep='egrep --color=auto' || alias grep='grep --color=auto'
has_command less && alias more='less'
has_command vim && alias vi='vim'

alias ftp='ftp -i'
alias irb='irb --readline -r irb/completion --prompt simple'

# apt
alias aptc='apt-cache'
alias aptg='apt-get'
alias dpkgq='dpkg-query'

# docker
has_command podman && alias docker='podman'
has_command podman-compose && alias docker-compose='podman-compose'
alias d='docker'
alias db='docker build .'
alias dcomp='docker-compose'
alias denv='eval $(docker-machine env)'
alias drun='docker run -i -t --rm'
alias drmut='docker rmi $(docker images -q -f dangling=true)'
alias dm='docker-machine'

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# View HTTP traffic
alias sniff="sudo tcpdump -n -c 9999 -w - | wireshark -k -i -"

# URL-encode strings
alias urlencode='python3 -c "import sys; import urllib.parse; print(urllib.parse.quote_plus(sys.argv[1]));"'

# Canonical hex dump; some systems have this symlinked
has_command hd || alias hd="hexdump -C"

# Intuitive map alias
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias bell="tput bel"

alias home='cd $HOME'
alias dls='cd $HOME/Downloads'
alias doc='cd $HOME/Documents'
alias path='echo $PATH | tr ":" "\n"'

if [[ "$OSTYPE" == "darwin"* ]]; then

  if [[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]]; then
    alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
    alias view='/Applications/MacVim.app/Contents/MacOS/Vim -R'
    alias vimdiff='/Applications/MacVim.app/Contents/MacOS/Vim -d'
    alias gvim=mvim
  fi

  # macOS has no `md5sum`, so use `md5` as a fallback
  has_command md5sum || alias md5sum="md5"

  # macOS has no `sha1sum`, so use `shasum` as a fallback
  has_command sha1sum || alias sha1sum="shasum"

  # Merge PDF files
  # Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
  alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

  # Lock the screen (when going AFK)
  alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

  # Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
  alias macupdate='sudo softwareupdate -i -r -R; brew update && brew upgrade'

fi

alias cls="clear"
