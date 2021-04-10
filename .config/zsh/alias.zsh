alias _=sudo
alias d='dirs -v | head -10'

# Bunch of git bits...
alias g=git
alias ga='git add'
alias gb='git branch'
alias gbc='git checkout -b'
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

alias gen='fswatch . | xargs -I {} -n 1 pyaml pre-ui-lovelace.yaml -o ../ui-lovelace.yaml'

alias ls='exa'
alias l='exa'
alias la='exa -a'
alias ll='exa -lh'
alias lal='exa -la'
alias lrt='exa -lhrs=time'

alias dotfiles=yadm
alias pdbit='python -m pdb -c continue '

alias plcat='plutil -convert xml1 -o -'

alias cat='bat --style=numbers,header'
alias more=less
alias please=sudo !!
alias pu=pushd
alias rake='noglob rake'
alias run-help=man
alias rvm-restart='rvm_reload_flag=1 source '\''/Users/glenn/.rvm/scripts/rvm'\'

local vim=vim
local neovim=nvim
alias v=$neovim
alias vi=$neovim
alias emacs=$neovim

alias wezterm='/Applications/WezTerm.app/Contents/MacOS/wezterm'
alias which-command=whence
alias xyzzy="echo nothing happens"
