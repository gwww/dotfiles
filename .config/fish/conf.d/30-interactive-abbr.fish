status is-interactive; or return 0

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
