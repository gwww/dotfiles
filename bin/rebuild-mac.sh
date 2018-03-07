#!/usr/bin/env bash

cd $HOME

if which -s brew; then 
  echo 'homebrew already installed; using existing installation'
else
  echo 'Installing homebrew...'
  /usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'
fi

echo "Updating homebrew..."
brew update

echo "Installing brews..."
# brew install cmake
# brew install exiftool
brew install elixir
brew install fd
brew install fzf
brew install git
# brew install gnu-getopt
# brew install gsl
brew install less
brew install lua
brew install pandoc
brew install ripgrep
brew install rsync
brew install tree
brew install vim
brew install yadm
brew install youtube-dl
brew install zsh

echo "Installing cask apps..."
brew install caskroom/cask/brew-cask

brew cask install --appdir='/Applications' alfred
brew cask alfred link
# brew cask install --appdir='/Applications' android-file-transfer
brew cask install --appdir='/Applications' calibre
brew cask install --appdir='/Applications' deluge
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

if which -s rvm; then 
  echo 'rvm already installed; using existing installation'
else
  echo 'Installing rvm and stable ruby...'
  curl -sSL https://get.rvm.io | bash -s stable --ruby --ignore-dotfiles
fi

source ~/.rvm/scripts/rvm
gem update --system
gem install bundler

echo "Clone dotfiles from github..."
git clone https://github.com/gwww/dotfiles.git $HOME/.dotfiles
$HOME/.dotfiles/link.sh

echo "Installing zsh-antigen..."
mkdir -p $HOME/.antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > $HOME/.antigen/antigen.zsh
source $HOME/.antigen/antigen.sh
antigen update

echo "Installing python eggs..."
sudo easy_install -U pytest
sudo easy_install -U spritemapper
