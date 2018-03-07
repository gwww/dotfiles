#
# Antigen
#
ANTIGEN_MUTEX=false
ANTIGEN_COMPDUMPFILE=$HOME/.cache/zcompdump
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  dirhistory
  gem
  gitfast
  gitignore
  mix
  sudo
EOBUNDLES
antigen apply

if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

#
# Set path
#
path=(
  $HOME/bin
  $path
)
source ~/.rvm/scripts/rvm
rvm use default >/dev/null

#
# Aliases
#
alias la='ls -A'
alias lal='ls -lA'
alias more='less'
alias rake='noglob rake'
alias ghi='git hist'
alias vi='vim'

chromepdf() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --headless --disable-gpu --print-to-pdf="$1" $2
}

# 
# Environment
#
export LESS="-RM"
export LESSHISTFILE=-
export EDITOR=vim
export HISTFILE=~/.cache/zsh_history
export DIRSTACKSIZE=9
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--inline-info"
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export PIP_CONFIG_FILE=~/.config/pip/pip.conf

# 
# Prompt
#
local ret_status="%(?..%{$fg_bold[red]%}✘ )%(!.%{$fg_bold[yellow]%}⚡  .)"
PROMPT='${ret_status}%{$fg_bold[cyan]%}%2c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

#
# Functions
#
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
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert
