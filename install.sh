#!/bin/bash

HOMEBREW_PATH=$(which brew)


if [["$HOMEBREW_PATH" == ""]]; then
    # Install Homebrew
    $(which ruby) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Update brew
brew update

# Install Heroku CLI
brew tap heroku/brew && brew install heroku

# Install NodeJS
brew install node

# Install mongo db
brew install mongodb

# Install Postgres
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

# Setup whoami database for postgres
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist


## TERMINAL STUFF

# Install iTerm2
brew cask install iterm2

# Install theme
npm install -g spaceship-prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"