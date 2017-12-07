#!/bin/bash

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages
apps=(
    iterm2
    dropbox
    flux
    dash
    imagealpha
    imageoptim
    iterm2
    atom
    firefox
    google-chrome
    shupapan
    clipy
    appcleaner
    malwarebytes-anti-malware
    skitch
    skype
    slack
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
