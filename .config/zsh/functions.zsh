# read markdown files like manpages
function md() {
    pandoc -s -f markdown -t man "$*" | nroff -man
}

# Convert web page to PDF using headless Chrome
function chromepdf() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --headless --disable-gpu --print-to-pdf="$1" $2
}

# Pretty path print
function path() {
  echo $PATH | tr ":" "\n" | \
  awk "{ \
    sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
    sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
    sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
    sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
    sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
    print }"
}

# This was written entirely by Mikael Magnusson (Mikachu)
# Type '...' to get '../..' with successive .'s adding /..
function rationalise-dot {
  local MATCH # keep the regex match from leaking to the environment
  if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
    zle self-insert
  else
    zle self-insert
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert # without this, typing . aborts incr history search
setopt auto_cd


function _venv_status() {
  if [ -z $VIRTUAL_ENV ]; then
    echo "Inactive"
  else
    if [ "$PIPENV_ACTIVE" -eq 1 -a "$SHLVL" -gt 1 ]; then
      echo "Subshell"
    else
      echo "Activated"
    fi
  fi
}

# Small wrapper around pipenv to provide activate/deactivate commands
function pe() {
  if [[ $# = 1 && ${#1} > 1 ]]; then
    if [[ 'activate' =~ "^$1" ]]; then
      local venv="$(pipenv --venv 2> /dev/null)"
      if [ -n "$venv" ]; then
        echo "Activating '$venv'"
        source $venv/bin/activate
      else
        echo "No virtual environment for this directory"
      fi
    elif [[ 'deactivate' =~ "^$1" ]]; then
      local s=$(_venv_status)
      if [ "$s" = "Activated" ]; then
        echo "Deactivating '$VIRTUAL_ENV'"
        deactivate
      elif [ "$s" = "Subshell" ]; then
        echo "Exiting '$VIRTUAL_ENV' subshell"
        exit 0
      else
        echo "No virtual environment active"
      fi
    elif [[ 'status' =~ "^$1" ]]; then
      local s=$(_venv_status)
      if [ "$s" != "Inactive" ]; then
        local ve=" ($VIRTUAL_ENV)"
      fi
      echo "Python venv: $s$ve"
      pipenv --version
    elif [[ 'changelog' =~ "^$1" ]]; then
      curl -vs https://raw.githubusercontent.com/pypa/pipenv/master/HISTORY.txt 2>/dev/null | more
    else
      pipenv $@
    fi
  else
    pipenv $@
  fi
}
