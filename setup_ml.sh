#! /bin/bash

#Move to home directory
cd ~

CONDA_ML_REQUIREMENTS=$HOME/workspace/ml_conda_requirements.txt

############################################################################################
### Conda installation [Start] ###
echo "Checking if conda is installed"

if [ -z `which conda` ]; then
  echo "Conda is not installed. Installing..."

  #Download conda
  echo "Downloading..."
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

  #Install conda
  echo "Installing..."
  bash Miniconda3-latest-Linux-x86_64.sh

  #Configure the path
  echo "Configuring PATH..."
  ln -s $HOME/miniconda3/bin/conda /usr/local/bin/conda
else
  echo "Miniconda installation exists."
fi
### Conda installation [End] ###
############################################################################################

############################################################################################
### Conda configuration [Start] ###
shell_name=`basename $SHELL`
fish_config=$HOME/.config/fish/conf.d/config.fish
miniconda_fish_config="source $HOME/miniconda3/etc/fish/conf.d/conda.fish"

echo "Configuring miniconda in $fish_config"

if [ "$shell_name" = "fish" ] && [[ `grep "$miniconda_fish_config" $fish_config` = "" ]]; then
  #Create configuration
  echo "Creating miniconda configuration in: $fish_config"

  for line in "" "### Conda initialization ###" "set -gx PATH $HOME/miniconda3/bin $PATH" "$miniconda_fish_config"
  do
    echo $line | tee -a $fish_config
  done
else
  echo "Miniconda configuration exists in $fish_config"
fi

### Conda configuration [End] ###
############################################################################################

############################################################################################
### X11 support [Start] ###
echo "Installing X11 support libraries..."
sudo apt install libgl1-mesa-glx mesa-utils

if [ $? -ne 0 ]; then
  #Install failed dependencies
  echo "Install missing dependencies"
  sudo apt --fix-broken install

  #Retry X11 lib installation
  echo "Attempt second install"
  sudo apt install libgl1-mesa-glx mesa-utils
fi

echo "Installation complete"
### X11 support [End] ###
############################################################################################

############################################################################################
### Sound support [Start] ###
echo "Installing sound support libraries..."
sudo apt install libasound2
### Sound support [End] ###
############################################################################################

############################################################################################
### VS Code [Start] ###
echo "Checking if VS Code is installed"
vscode_file=vscode_amd64.deb

if [ -z `which code` ]; then
  echo "VS code is not installed. Installing..."

  #Download conda
  echo "Downloading..."
  wget "https://go.microsoft.com/fwlink/?LinkID=760868" --output-document $vscode_file

  #Install conda
  echo "Installing..."
  sudo dpkg -i $vscode_file
else
  echo "VS Code installation exists"
fi
### VS Code [End] ###
############################################################################################

############################################################################################
### Conda ML package installation [Start] ###
echo "Installing ML requirements..."
conda install --file $CONDA_ML_REQUIREMENTS
### Conda ML package installation [End] ###
############################################################################################

