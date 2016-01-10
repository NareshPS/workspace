# get latest packages
sudo apt-get update

# copy from command line
sudo apt-get install xclip

# fish
sudo apt-get install fish

# on my fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# configure vim
cd ~/workspace
./setup_vim
cd -

# configure git
git config --global user.name "ludak"
git config --global user.email ludak@ludak.me
