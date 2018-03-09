export LSCOLORS=Gxfxcxdxbxegedabagacad

# Set path
path=(
  $HOME/bin
  $path
)

# source ~/.rvm/scripts/rvm
# rvm use default >/dev/null

# Environment
export LESS="-RM"
export LESSHISTFILE=-
export EDITOR=vim
export VISUAL=vim
export HISTFILE=~/.local/share/zsh/history
export DIRSTACKSIZE=9
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--inline-info"
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc
export PIP_CONFIG_FILE=~/.config/pip/pip.conf

# Colourized man pages
# source: https://github.com/imkira/dotfiles/blob/master/.zsh/colored-man-pages.zsh
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;33;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

# 
# Prompt
#
local ret_status="%(?..%{$fg_bold[red]%}✘ )%(!.%{$fg_bold[yellow]%}⚡  .)"
PROMPT='${ret_status}%{$fg_bold[cyan]%}%2c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
