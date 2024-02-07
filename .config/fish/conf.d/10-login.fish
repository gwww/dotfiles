status is-login; or return 0

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
set -gx MISE_FISH_AUTO_ACTIVATE 0

set -gx CUPS_CACHEDIR ~/.local/state/cups
set -gx CUPS_STATEDIR ~/.local/state/cups
set -gx CUPS_DATADIR ~/.local/state/cups

set -l brewcmd (path filter /opt/homebrew/bin/brew /usr/local/bin/brew)[1]; and $brewcmd shellenv | source
set -gx PATH ~/bin $POETRY_HOME/bin ~/.local/share/mise/shims $PNPM_HOME $PATH
