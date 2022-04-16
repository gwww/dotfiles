#
# All shell startup stuff
#
export LANG="en_CA.UTF-8"
export LC_ALL="en_CA.UTF-8"
export PYTHONSTARTUP=~/.config/python/pythonrc
export PYLINTHOME=~/.local/share/pylint
export PIP_CONFIG_FILE=~/.config/python/pip.conf
export GNUPGHOME=~/.local/share/gnupg
export POETRY_HOME=~/.local/share/pypoetry
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc
export CUPS_CACHEDIR=~/.local/share/cups
export CUPS_DATADIR=~/.local/share/cups

path=(~/bin $POETRY_HOME/bin /usr/local/bin $path)

if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

eval "$(zoxide init zsh)"

rehash

export ASDF_DATA_DIR=~/.local/share/asdf
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=$ASDF_DATA_DIR/tool-versions
source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh

typeset -U path # remove duplicates from path

export EDITOR=$HOMEBREW_PREFIX/opt/nvim/bin/nvim
export VISUAL=$HOMEBREW_PREFIX/opt/nvim/bin/nvim

autoload -U colors && colors
