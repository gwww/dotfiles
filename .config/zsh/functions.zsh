# read markdown files like manpages
function mdman() {
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
    if [ "$POETRY_ACTIVE" -eq 1 -a "$SHLVL" -gt 1 ]; then
      echo "Subshell"
    else
      echo "Activated"
    fi
  fi
}

# Small wrapper around poetry to provide activate/deactivate commands
function po() {
  if [[ $# = 1 && ${#1} > 1 ]]; then
    if [[ 'activate' =~ "^$1" ]]; then
      if [ -d .venv ]; then
        source .venv/bin/activate
        echo "Activated '$VIRTUAL_ENV'."
      else
        echo "No virtual environment in this directory."
      fi

    elif [[ 'deactivate' =~ "^$1" ]]; then
      local s=$(_venv_status)
      if [ "$s" = "Activated" ]; then
        echo "Deactivating '$VIRTUAL_ENV'."
        deactivate
      elif [ "$s" = "Subshell" ]; then
        echo "Exiting '$VIRTUAL_ENV' subshell."
        exit 0
      else
        echo "No virtual environment active."
      fi

    elif [[ 'status' =~ "^$1" ]]; then
      local s=$(_venv_status)
      if [ "$s" != "Inactive" ]; then
        local ve=" ($VIRTUAL_ENV)"
      fi
      echo "Python venv: $s$ve"
      poetry --version

    elif [[ 'changelog' =~ "^$1" ]]; then
      curl -vs https://raw.githubusercontent.com/sdispater/poetry/master/CHANGELOG.md 2>/dev/null | pandoc -f markdown -t plain | more

    else
      poetry $@
    fi
  else
    poetry $@
  fi
}

function e() {
  if [[ $# != 1 ]]; then
    echo "Supply directory shortcut to goto."
    return 1
  fi
  local dir=""
  case $1 in
    pyaml) dir="$HOME/Development/automation/config/pyaml" ;;
    upb)   dir="$HOME/Development/automation/upb/upb-lib" ;;
    elk)   dir="$HOME/Development/automation/elk/elkm1" ;;
    *)     echo "Unknown directory shortcut name: $1"; return 2 ;;
  esac
  cd $dir
  return 0
}

function ea() {
  e $*
  [[ $? != 0 ]] || po activate
}
