#
# All things interactive shell
#

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-messages --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--inline-info --color fg:-1,bg:-1,hl:45,fg+:3,bg+:233,hl+:229,info:150,prompt:110,spinner:150,pointer:167,marker:174"

export LESS="-RM"
export LESSHISTFILE=-

# xyzzy :)
export LSCOLORS=Gxfxcxdxbxegedabagacad

export ELKM1_URL=elk://192.168.1.12
export UPBPIM_URL=serial:///dev/cu.KeySerial1:4800
export UPBPIM_URL=tcp://192.168.1.14:7000

# Setup for good long ability to look back on life...
export HISTFILE=~/.local/share/zsh/history
export HISTSIZE=6000
export SAVEHIST=5000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups        # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history      # save history entries as soon as they are entered
setopt share_history           # share command history data

# Disable python virtualenv activate from modifying prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Colourized man pages
# Source: https://github.com/imkira/dotfiles/blob/master/.zsh/colored-man-pages.zsh
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;33;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'
