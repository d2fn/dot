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

# Apps
apps=(
  dropbox
  slack
  transmit
  appcleaner
  hazel
  qlmarkdown
  seil
  spotify
  arq
  flash
  iterm2
  qlprettypatch
  shiori
  sublime-text3
  virtualbox
  atom
  flux
  mailbox
  qlstephen
  sketch
  tower
  vlc
  cloudup
  nvalt
  quicklook-json
  skype
  transmission
)

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

apps=(
  dropbox
  sublime-text3
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
  cloudup
  nvalt
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

