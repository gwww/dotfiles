
function yl --description 'Start lazygit on the .dotfiles bare YADM repo'
    # From: https://github.com/Mellbourn/dotfiles
    abbr --add yl lazygit \
      --use-config-file "$HOME/.config/yadm/lazygit.yml,$HOME/Library/Application\ Support/lazygit/config.yml" \
      --work-tree ~ \
      --git-dir ~/.local/share/yadm/repo.git
end
