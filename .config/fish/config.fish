set -gx LANG en_CA.UTF-8
set -gx LC_ALL en_CA.UTF-8
set -gx LC_CTYPE en_CA.UTF-8
set -gx PYTHONSTARTUP ~/.config/python/pythonrc
set -gx PYLINTHOME ~/.local/share/pylint
set -gx PIP_CONFIG_FILE ~/.config/python/pip.conf
set -gx GNUPGHOME ~/.local/share/gnupg
set -gx POETRY_HOME ~/.local/share/pypoetry
set -gx RIPGREP_CONFIG_PATH ~/.config/ripgrep/ripgreprc
set -gx PNPM_HOME /Users/glenn/Library/pnpm

set -gx CUPS_CACHEDIR ~/.local/state/cups
set -gx CUPS_STATEDIR ~/.local/state/cups
set -gx CUPS_DATADIR ~/.local/state/cups

set -l brewcmd (path filter /opt/homebrew/bin/brew /usr/local/bin/brew)[1]; and $brewcmd shellenv | source
set -gx PATH ~/bin $POETRY_HOME/bin $PNPM_HOME $PATH

status is-interactive; or return 0

fish_config theme choose 'Catppuccin Mocha'
set -g fish_greeting

# Bunch of git bits...
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

abbr --add brewdeps 'brew leaves | xargs brew deps --formula --for-each | sed "s/^.*:/$(tput setaf 10)&$(tput sgr0)/"'

# From: https://github.com/Mellbourn/dotfiles
abbr --add yl lazygit --use-config-file "$HOME/.config/yadm/lazygit.yml,$HOME/Library/Application\ Support/lazygit/config.yml" \
  --work-tree ~ --git-dir ~/.local/share/yadm/repo.git
abbr --add lg lazygit

abbr --add l ls
abbr --add la ls -a
abbr --add ll ls -hl
abbr --add lal ls -ahl
abbr --add lla ls -hla
abbr --add lrt ls -hlart

abbr --add cat bat --theme=TwoDark --style=numbers,header
abbr --add more less
abbr --add please sudo !!
abbr --add rake noglob rake

set -l neovim nvim
abbr --add v $neovim
abbr --add vi $neovim
abbr --add emacs $neovim

abbr --add wezterm /Applications/WezTerm.app/Contents/MacOS/wezterm
abbr --add xyzzy echo nothing happens
abbr --add rtx echo Command moved to "mise"
abbr --add plcat plutil -convert xml1 -o -

# set -gx EDITOR $HOMEBREW_PREFIX/opt/nvim/bin/nvim
# set -gx VISUAL $HOMEBREW_PREFIX/opt/nvim/bin/nvim

set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
set -gx FZF_DEFAULT_OPTS "--inline-info --color fg:-1,bg:-1,hl:45,fg+:3,bg+:233,hl+:229,info:150,prompt:110,spinner:150,pointer:167,marker:174"
set -gx POETRY_VIRTUALENVS_IN_PROJECT true
set -gx LESS "-RMXF"
set -gx LESSHISTFILE -
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # Disable python virtualenv activate from modifying prompt
set -gx NNN_COLORS '2365'

# xyzzy :)
set -gx LSCOLORS Gxfxcxdxbxegedabagacad

set -gx ELKM1_URL elk://192.168.2.12
set -gx UPBPIM_URL serial:///dev/cu.KeySerial1:4800
set -gx UPBPIM_URL tcp://192.168.1.14:7000

zoxide init fish | source
