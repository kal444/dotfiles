# define shared aliases for 
# both bash and zsh
#
if [ `/usr/bin/id -u` -eq 0 ]; then
  # force interactive file operations for root
  alias cp='cp -i'
  alias rm='rm -i'
  alias mv='mv -i'
fi

if ls --color=auto -d . >/dev/null 2>&1; then
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
alias tree='tree -h -xF'

# colorize greps
alias grep='egrep --color=auto'
alias egrep='egrep --color=auto'

# allow sudo on aliases
alias sudo='sudo '

# week number
alias week='date +%V'

has_command less && alias more='less'
has_command vim && alias vi='vim'

alias ftp='ftp -i'
alias irb='irb --readline -r irb/completion --prompt simple'

alias d='docker'
alias dm='docker-machine'

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Canonical hex dump; some systems have this symlinked
has_command hd || alias hd="hexdump -C"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias bell="tput bel"

if [[ "$OSTYPE" == "darwin"* ]]; then

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
  alias update='sudo softwareupdate -i -a; brew update && brew upgrade --cleanup'

fi
