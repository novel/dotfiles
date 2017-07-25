#!/bin/bash

brew -v > /dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

BREW_CASKS="caskroom/cask/slack \
            caskroom/fonts/font-terminus \
            caskroom/fonts/font-dejavu-sans \
            caskroom/cask/google-chrome \
            caskroom/cask/skype \
            caskroom/cask/virtualbox \
            caskroom/cask/virtualbox-extension-pack \
           "

BREW_PKGS="git tmux"

for i in ${BREW_CASKS}; do brew cask install ${i}; done

for i in ${BREW_PKGS}; do brew install ${i}; done
