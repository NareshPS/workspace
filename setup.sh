#! /bin/bash

# get latest packages
sudo apt update

# copy from command line
sudo apt install xclip

# fish
sudo apt install fish

# on my fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# configure vim
cd ~/workspace
./setup_vim
cd -

#Make fish default shell
fish_location=`which fish`
chsh -s $fish_location
echo $fish_location | sudo tee -a /etc/shells

#Download fish extensions
#curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

#Upgrade git
sudo apt install --upgrade git

# configure git
git config --global user.name "ludak"
git config --global user.email ludak@ludak.me
git config --global push.default simple
