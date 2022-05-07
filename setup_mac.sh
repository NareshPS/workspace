#! /bin/bash

# fish
brew install fish

# on my fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# configure vim
cd ~/workspace
./setup_vim
cd -

# Make fish default shell
fish_location=`which fish`
echo $fish_location
echo $fish_location | sudo tee -a /etc/shells
chsh -s $fish_location

# set fish paths
fish -c "set -U fish_user_paths /opt/homebrew/bin $fish_user_paths"

# configure git
git config --global user.name "ludak"
git config --global user.email ludak@ludak.me
git config --global push.default simple
