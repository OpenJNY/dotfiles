#!/bin/bash

# Install Caskroom
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

# Install packages
apps=(
    iterm2
    flux
    dash
    imagealpha
    imageoptim
    atom
    visual-studio-code
    firefox
    google-chrome
    shupapan
    clipy
    appcleaner
    skitch
    slack
)

for app in ${apps[@]}; do
    brew cask install $app
done

fonts=(
    font-fontawesome
    font-noto-mono-for-powerline
    font-noto-sans-cjk-jp
    font-noto-serif-cjk-jp
    font-source-han-code-jp
    font-myrica
)

for font in ${fonts[@]}; do
    if [[ -z $(brew cask list | grep $font) ]]; then
        brew cask install $font
    else
        echo $font is already installed.
    fi
done

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
