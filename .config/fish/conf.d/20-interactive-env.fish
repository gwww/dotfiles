status is-interactive; or return 0

set -gx EDITOR $HOMEBREW_PREFIX/bin/nvim
set -gx VISUAL $HOMEBREW_PREFIX/bin/nvim

set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
set -gx FZF_DEFAULT_OPTS "--inline-info --color fg:-1,bg:-1,hl:45,fg+:3,bg+:233,hl+:229,info:150,prompt:110,spinner:150,pointer:167,marker:174"
set -gx POETRY_VIRTUALENVS_IN_PROJECT true
set -gx LESS "-RMXF"
set -gx LESSHISTFILE -
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # Disable python virtualenv activate from modifying prompt
set -gx NNN_COLORS '2365'
set -gx BAT_THEME TwoDark
set -gx BAT_STYLE numbers,changes

# xyzzy :)
set -gx LSCOLORS Gxfxcxdxbxegedabagacad

set -gx ELKM1_URL elk://192.168.2.12
set -gx UPBPIM_URL tcp://192.168.1.14:7000

set -gx NVIM_APPNAME AstroV4
