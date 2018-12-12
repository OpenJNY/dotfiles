#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap homebrew/dupes

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install basic tools.

basictools=(
    zsh
    zsh-syntax-highlighting
    lua
    vim --with-lua
    tmux
    homebrew/completions/brew-cask-completion
    homebrew/dupes/grep
    homebrew/dupes/openssh
    wget
    curl
    tree
    rename
    parallel
    screen
    openssl
    source-highlight
)

brew install "${basictools[@]}"

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

gnuutils=(
    coreutils
    moreutils
    findutils
    gnu-sed --with-default-names
)

brew install "${gnuutils[@]}"

# Install development tools packages.

devtools=(
    go
    automake
    cmake
    gcc
    clang-format
    docker
    git
    mysql
    pandoc
    pyenv
)

brew install "${devtools[@]}"

# Remove outdated versions from the cellar
brew cleanup
