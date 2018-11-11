#
# All things interactive shell
#

# Add to the path ensuring no duplicates
for x in ~/bin; do
  case ":$PATH:" in
    *":$x:"*) :;; # already there
    *) PATH="$x:$PATH";;
  esac
done

export PYENV_ROOT=~/.local/share/pyenv

# If pyenv shims not already in path, add them
[[ ":$PATH:" != *":$PYENV_ROOT/shims:"* ]] && eval "$(pyenv init -)"
true

eval "$(fasd --init auto)"

export LANG="en_CA.UTF-8"
export LC_ALL="en_CA.UTF-8"

export CUPS_CACHEDIR=~/.local/share/cups
export CUPS_DATADIR=~/.local/share/cups
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--inline-info --color fg:-1,bg:-1,hl:45,fg+:3,bg+:233,hl+:229,info:150,prompt:110,spinner:150,pointer:167,marker:174"
export PYLINTHOME=~/.local/share/pylint

export PIP_CONFIG_FILE=~/.config/pip/pip.conf
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc
export LESS="-RM"
export LESSHISTFILE=-
export EDITOR=nvim
export VISUAL=nvim

export PIPENV_SHELL_FANCY=1
export PIPENV_VENV_IN_PROJECT=1

export TWINE_USERNAME=gwww

# xyzzy :)
export LSCOLORS=Gxfxcxdxbxegedabagacad

export ELKM1_URL=elk://192.168.1.201

# Setup for good long ability to look back on life...
export HISTFILE=~/.local/share/zsh/history
export HISTSIZE=5000
export SAVEHIST=5000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Enable up/down arrow to search history based on what is already typed
# Cursor placed at end of line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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
