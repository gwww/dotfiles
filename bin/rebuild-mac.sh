#!/usr/bin/env bash

cd $HOME

whence brew >/dev/null
if [ $? -eq 0 ]; then
  echo 'homebrew already installed; using existing installation'
else
  echo 'Installing homebrew...'
  /usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'
fi

echo "Updating homebrew..."
brew update

echo "Installing brews..."
brew install elixir
brew install fasd
brew install fd
brew install fzf
brew install git
brew install less
brew install pandoc
brew install pyenv
brew install ripgrep
brew install rsync
brew install ruby
brew install tig
brew install tree
brew install vim
brew install yadm
brew install youtube-dl
brew install zsh

echo "Installing cask apps..."
brew tap caskroom/cask

brew cask install --appdir='/Applications' alfred
brew cask alfred link
brew cask install --appdir='/Applications' calibre
# brew cask install --appdir='/Applications' deluge
brew cask install --appdir='/Applications' dropbox
brew cask install --appdir='/Applications' google-chrome
brew cask install --appdir='/Applications' hammerspoon
brew cask install --appdir='/Applications' iterm2
brew cask install --appdir='/Applications' karabiner-elements
brew cask install --appdir='/Applications' kindle
brew cask install --appdir='/Applications' qlmarkdown
brew cask install --appdir='/Applications' qlstephen
brew cask install --appdir='/Applications' skype
brew cask install --appdir='/Applications' tunnelblick
brew cask install --appdir='/Applications' vlc

brew tap homebrew/dupes
brew tap caskroom/fonts

brew cask install font-inconsolata-g-for-powerline

echo "Brews installed..."
brew list --versions
echo "Casks installed..."
brew cask list --versions

gem update --system
gem install bundler

echo "Clone dotfiles from github..."
yadm clone https://github.com/gwww/dotfiles.git

echo "Installing python eggs..."
sudo easy_install -U spritemapper

echo "Create .local..."
mkdir -p ~/.local/share/zsh ~/.local/share/vim ~/local/share/virtualenvs
mkdir -p ~/.local/share/cups
