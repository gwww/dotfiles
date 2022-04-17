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
    sub(\"/usr\",   \"$fg[green]/usr$reset_color\"); \
    sub(\"/bin\",   \"$fg[blue]/bin$reset_color\"); \
    sub(\"/opt\",   \"$fg[cyan]/opt$reset_color\"); \
    sub(\"/sbin\",  \"$fg[magenta]/sbin$reset_color\"); \
    sub(\"/local\", \"$fg[yellow]/local$reset_color\"); \
    print }"
}

# This was written entirely by Mikael Magnusson (Mikachu)
# Type '...' to get '../..' with successive .'s adding /..
function _rationalise-dot {
  local MATCH # keep the regex match from leaking to the environment
  if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
    zle self-insert
  else
    zle self-insert
  fi
}
zle -N _rationalise-dot
bindkey . _rationalise-dot
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
      local script="venv/bin/activate"
      local git="$(git rev-parse --show-toplevel 2> /dev/null)/"
      local VENV_DIRS=(".$script" "$script" "$git.$script" "$git$script")
      typeset -U VENV_DIRS # remove duplicates from path
      for dir in $VENV_DIRS; do
        if [ -f $dir ]; then
          source $dir
          echo "$fg_bold[green]Activated '$VIRTUAL_ENV'$reset_color"
          return
        fi
      done
      echo "$fg_bold[red]No virtual environment found.$reset_color"

    elif [[ 'deactivate' =~ "^$1" ]]; then
      local s=$(_venv_status)
      if [ "$s" = "Activated" ]; then
        echo "$fg_bold[green]Deactivating '$VIRTUAL_ENV'$reset_color"
        deactivate
      elif [ "$s" = "Subshell" ]; then
        echo "$fg_bold[green]Exiting '$VIRTUAL_ENV' subshell$reset_color"
        exit 0
      else
        echo "$fg_bold[red]No virtual environment active.$reset_color"
      fi

    elif [[ 'status' =~ "^$1" ]]; then
      local s=$(_venv_status)
      if [ "$s" != "Inactive" ]; then
        local ve=" ($VIRTUAL_ENV)"
      fi
      echo "Python venv: $s$ve"
      poetry --version

    elif [[ 'changelog' =~ "^$1" ]]; then
      curl -vs https://raw.githubusercontent.com/python-poetry/poetry/master/CHANGELOG.md 2>/dev/null | pandoc -f markdown -t plain | more

    else
      poetry $@
    fi
  else
    poetry $@
  fi
}

# SHORTCUTS=~/.config/zsh/j_dirs.txt
#
# function __read_jump_dirs() {
#   unset j_dirs
#   declare -gA j_dirs
#   while read shortcut jump_dir venv; do
#     j_dirs[$shortcut]="$jump_dir $venv"
#   done <$SHORTCUTS
# }
# __read_jump_dirs
#
# function j() {
#   if [[ -z $j_dirs[$1] ]]; then
#     echo "$fg_bold[red]Unknown shortcut '$1'; use one of: ${(k)j_dirs}$reset_color"
#     return 1
#   fi
#   eval cd $j_dirs[$1]
#   return 0
# }
#
# function ja() {
#   for dir in "$@"; do
#     j $dir
#     [[ $? == 0 ]] && [[ -f .venv/bin/activate ]] && source .venv/bin/activate
#   done
# }
#
# function jedit() {
#   vi $SHORTCUTS
#   echo "Sourcing new shortcuts..."
#   __read_jump_dirs
# }
