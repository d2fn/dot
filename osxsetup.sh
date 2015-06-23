#!/bin/sh

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew installed, skipping."
fi

# Update homebrew recipes
echo "Running brew update"
brew update

echo "Installing updated utilities"
# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
  graphicsmagick
  webkit2png
  rename
  ffmpeg
  sshfs
  tree
  ack
  tmux
)

echo "installing binaries: ${binaries[@]}"
brew install ${binaries[@]}

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

apps=(
  emacs
  dropbox
  sublime-text
  adobe-creative-cloud
  rstudio
  shiori
  iterm2
  arq
  appcleaner
  qlmarkdown
  qlprettypatch
  qlcolorcode
  flux
  gitx
  tower
  nvalt
  caffeine
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

