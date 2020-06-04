alias _=sudo
alias d='dirs -v | head -10'

# Bunch of git bits...
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gcam='git commit --all --message'
alias gcm='git commit --message'
alias gco='git checkout'
alias gd='git diff'
alias ghi='git hist'
alias gst='git status'

alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias history='fc -l 1'

alias ls='exa'
alias l='exa -lah'
alias la='exa -a'
alias lal='exa -la'
alias ll='exa -lh'
#alias ls='ls -G'
alias lsa='exa -lah'

alias dotfiles=yadm

alias cat='bat --style=numbers,header'
alias more=less
alias please=sudo !!
alias pu=pushd
alias rake='noglob rake'
alias run-help=man
alias rvm-restart='rvm_reload_flag=1 source '\''/Users/glenn/.rvm/scripts/rvm'\'
alias v="vim"
alias vi="vim"
alias emacs="vim"
alias which-command=whence
alias xyzzy="echo nothing happens"
