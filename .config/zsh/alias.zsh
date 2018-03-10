alias _=sudo
alias d='dirs -v | head -10'

# Bunch of git bits...
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gcam='git commit -a -m'
alias gcm='git checkout master'
alias gco='git checkout'
alias ghi='git hist'
alias gst='git status'

alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias history='fc -l 1'

alias l='ls -lah'
alias la='ls -A'
alias lal='ls -lA'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'

#alias pe=pipenv

alias dotfiles=yadm

alias more=less
alias please=sudo !!
alias po=popd
alias pu=pushd
alias rake='noglob rake'
alias run-help=man
alias rvm-restart='rvm_reload_flag=1 source '\''/Users/glenn/.rvm/scripts/rvm'\'
alias v="vim"
alias vi="vim"
alias emacs="vim"
alias which-command=whence
alias xyzzy="echo nothing happens"

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

# Small wrapper around pipenv to provice activate/deactivate commands
function pe() {
  if [[ $# -gt 0 ]]; then
    case $1 in
      act|activate)
        venv="$(pipenv --venv 2> /dev/null)"
        if [ -n "$venv" ]; then
          echo "Activating '$venv'"
          source $venv/bin/activate
        else
          echo "No virtual environment for this directory"
        fi
      ;;
      de|deactivate)
        if [ -n "$VIRTUAL_ENV" ]; then
          echo "Deactivating '$VIRTUAL_ENV'"
          deactivate
        else
          echo "No virtual environment active"
        fi
      ;;
      *)
        pipenv $@
      ;;
    esac
  else
    pipenv $@
  fi
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
