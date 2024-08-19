status is-interactive; or return 0

######## Environment
set -gx EDITOR $HOMEBREW_PREFIX/bin/nvim
set -gx VISUAL $HOMEBREW_PREFIX/bin/nvim

set -gx POETRY_VIRTUALENVS_IN_PROJECT true
set -gx LESS "-RMXF"
set -gx LESSHISTFILE -
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # Disable python virtualenv activate from modifying prompt
set -gx NNN_COLORS '2365'
set -gx BAT_THEME Nord
set -gx BAT_STYLE numbers,changes

# xyzzy :)
set -gx LSCOLORS Gxfxcxdxbxegedabagacad

set -gx ELKM1_URL elk://192.168.2.12
set -gx UPBPIM_URL tcp://192.168.1.14:7000

######## Aliases
set -l eza eza --group-directories-first
alias l    "$eza"
alias ls   "$eza"
alias la   "$eza --all"
alias lal  "$eza --long --all"
alias ll   "$eza --long"
alias lla  "$eza --long --all"
alias lrt  "$eza --long --sort=time --reverse"
alias tree "$eza --tree"

######## Abbreviations

# Git abbreviations
abbr --add ga git add
abbr --add gb git branch
abbr --add gbc git checkout -b
abbr --add gbd git branch -d
abbr --add gc git commit -v
abbr --add gcm git commit --message
abbr --add gco git checkout
abbr --add gd git diff
abbr --add ghi git hist
abbr --add gst git status

# Misc abbreviations
abbr --add brewdeps 'brew leaves | xargs brew deps --formula --for-each | sed "s/^.*:/$(tput setaf 10)&$(tput sgr0)/"'
abbr --add brewdump 'brew bundle dump --file - | egrep "$(brew leaves | xargs printf \'"%s"|\')tap|cask"'
abbr --add lg lazygit
abbr --add vi nvim
abbr --add wezterm /Applications/WezTerm.app/Contents/MacOS/wezterm
abbr --add ghostty /Applications/Ghostty.app/Contents/MacOS/ghostty
abbr --add xyzzy echo nothing happens
abbr --add plcat plutil -convert xml1 -o -

############ Setup theme, keybinds, ...
fish_config theme choose 'Catppuccin Mocha'
zoxide init fish | source
