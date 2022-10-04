# `tre` is a shorthand for `tree` with color enabled,
# ignoring the `.git` directory,
# listing directories first.
# The output gets piped into `less`
function tre() {
  tree -C -I '.git|node_modules|bower_components' --dirsfirst "$@" | less;
}

# run a git command on all git repos under the current directory
function gitr() {
  local gitcmd=$1
  if [ -z "$gitcmd" ]; then
    echo "Usage: gitr <command>"
    return 0
  fi
  shift
  # Use .git to find git repos. But ignore any repo directories that's hidden
  find . -name .git -not -path "*/.*/*" | sort |
  while read i; do
    local dir=$(dirname $i)
    echo $dir
    git -C $dir $gitcmd "$@"
    echo
  done
}

# log something I did
function did() {
  done_file=~/Documents/done.md
  timestamp="$(date +'%Y-%m-%d %H:%M:%S %A Week %V')"

  if [ -n "$*" ]
  then
    # log the entry from the command line
    message="$*"
    touch $done_file
    echo -e "### $timestamp\n- $message\n\n$(cat $done_file)" >| "$done_file"
  else
    # no entry input, do this in vim
    vim +"normal ggO$timestamp" +'normal o' +'normal ggo- ' +'startinsert!' "$done_file"
  fi

  # then show what I just added to that file - print everything up to the first blank line in the file
  echo ""
  # don't print automatically
  # once it hits a blank line quit (without printing the blank line)
  # otherwise print the non-blank line
  sed -n -e '/^$/ q' -e 'p' "$done_file"
}
function lastweek() {
  last_week=$(printf 'Week %02d' "$(( $(date +%V)-1 ))")
  done_file=~/Documents/done.md

  echo "$last_week Summary"

  sed -ne '
  # if empty line, check all held lines
  /^$/ b check_and_print
  # if at EOF, check all held lines
  $ b check_and_print
  # hold the line
  H
  # to the end, skip subroutine
  b
  :check_and_print
  # hold buffer to pattern buffer
  x
  # if pattern buffer has the right week number, print the buffer of all lines
  /'"$last_week"'/ p
  ' $done_file
}

# list files with have been modified in the last x days. x defaults to 1
function modified() {
  find . -mtime -${1:-1}
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
  if [ $# -eq 0 ]; then
    vim .;
  else
    vim "$@";
  fi;
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1");
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8";
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
  if [ -t 0 ]; then # argument
    echo "$*" | python -mjson.tool | pygmentize -l javascript;
  else # pipe
    python -mjson.tool | pygmentize -l javascript;
  fi;
}

# UTF-8-encode a string of Unicode symbols
function escape() {
  printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo ""; # newline
  fi;
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
  perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo ""; # newline
  fi;
}

# Get a character’s Unicode code point
function codepoint() {
  perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo ""; # newline
  fi;
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
  if [ -z "${1}" ]; then
    echo "ERROR: No domain specified.";
    return 1;
  fi;

  local domain="${1}";
  echo "Testing ${domain}…";
  echo ""; # newline

  local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
    | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

  if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
    local certText=$(echo "${tmp}" \
      | openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
      no_serial, no_sigdump, no_signame, no_validity, no_version");
    echo "Common Name:";
    echo ""; # newline
    echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
    echo ""; # newline
    echo "Subject Alternative Name(s):";
    echo ""; # newline
    echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
      | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
    return 0;
  else
    echo "ERROR: Certificate not found.";
    return 1;
  fi;
}

# Simple calculator
function calc() {
  local result=""
  result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
  #                       └─ default (when `--mathlib` is used) is 20
  #
  if [[ "$result" == *.* ]]; then
    # improve the output for decimal numbers
    printf "$result" |
    sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
      -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
      -e 's/0*$//;s/\.$//'   # remove trailing zeros
  else
    printf "$result"
  fi
  printf "\n"
}

# quick function to show temperature in F & C
function temp() {
  printf '%s°C\n' "$(gunits "tempF($@)" 'tempC' | xargs)"
  printf '%s°F\n' "$(gunits "tempC($@)" 'tempF' | xargs)"
}

if [[ "$OSTYPE" == "darwin"* ]]; then

  # Change working directory to the top-most Finder window location
  function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
  }

  # `o` with no arguments opens the current directory, otherwise opens the given
  # location
  function o() {
    if [ $# -eq 0 ]; then
      open .;
    else
      open "$@";
    fi;
  }

fi
