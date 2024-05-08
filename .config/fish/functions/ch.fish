function _md_file
      curl -vs $argv[1] 2>/dev/null | pandoc -f markdown -t plain | less
end

function _releases_page
  open $argv[1]
end

function ch --description 'Display the changelog for the named argument'
  if test (count $argv) -ge 1
    if string match -- "$argv[1]" "fd" >/dev/null
      _md_file https://raw.githubusercontent.com/sharkdp/fd/master/CHANGELOG.md
    else if string match -- "$argv[1]" "bat" >/dev/null
      _md_file https://raw.githubusercontent.com/sharkdp/bat/master/CHANGELOG.md
    else if string match -- "$argv[1]" "poetry" >/dev/null
      _md_file https://raw.githubusercontent.com/python-poetry/poetry/master/CHANGELOG.md
    else if string match -- "$argv[1]" "mise" >/dev/null
      _md_file https://raw.githubusercontent.com/jdx/mise/main/CHANGELOG.md
    else if string match -- "$argv[1]" "fzf" >/dev/null
      _md_file https://raw.githubusercontent.com/junegunn/fzf/master/CHANGELOG.md
    else if string match -- "$argv[1]" "ripgrep" >/dev/null
      _md_file https://raw.githubusercontent.com/BurntSushi/ripgrep/master/CHANGELOG.md
    else if string match -- "$argv[1]" "eza" >/dev/null
      _md_file https://raw.githubusercontent.com/eza-community/eza/main/CHANGELOG.md
    else if string match -- "$argv[1]" "zoxide" >/dev/null
      _md_file https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/CHANGELOG.md
    else if string match -- "$argv[1]" "lazygit" >/dev/null
      _releases_page https://github.com/jesseduffield/lazygit/releases
    else if string match -- "$argv[1]" "git" >/dev/null
      if test -n "$argv[2]"
        _md_file https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/$argv[2].txt
      else
        echo "Must specify version of git. e.g.: '2.43.1'"
      end
    end
  else
    echo "Usage: ch <program>"
  end
end
