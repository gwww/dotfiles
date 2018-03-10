alias _=sudo
alias d='dirs -v | head -10'

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
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias gst='git status'

alias history='fc -l 1'

alias l='ls -lah'
alias la='ls -A'
alias lal='ls -lA'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'

alias pe=pipenv

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
    pandoc -s -f markdown -t man "$*" | man -l -
}

# Convert web page to PDF using headless Chrome
chromepdf() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --headless --disable-gpu --print-to-pdf="$1" $2
}

# Pretty path print
path() {
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
