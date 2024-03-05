status is-interactive; or return 0

# Git abbreviations...
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

# File listing abbreviations...
abbr --add la ls -a
abbr --add ll ls -hl
abbr --add lal ls -ahl
abbr --add lla ls -hla
abbr --add lrt ls -hlart

# Misc...
abbr --add brewdeps 'brew leaves | xargs brew deps --formula --for-each | sed "s/^.*:/$(tput setaf 10)&$(tput sgr0)/"'
abbr --add brewdump 'brew bundle dump --file - | egrep "$(brew leaves | xargs printf \'"%s"|\')tap|cask"'
abbr --add lg lazygit
abbr --add vi nvim
abbr --add wezterm /Applications/WezTerm.app/Contents/MacOS/wezterm
abbr --add xyzzy echo nothing happens
abbr --add plcat plutil -convert xml1 -o -
