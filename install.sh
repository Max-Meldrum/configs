#!/bin/bash

# Script is intended for Linux only
# If this changes, I may have been kidnapped, please contact my family.

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
BLUE=$(tput setaf 4)
WHITE=$(tput setaf 7)
RESET=$(tput sgr0)


# BAT
BAT_VERSION="0.9.0"
BAT_DIR="bat-v"$BAT_VERSION"-x86_64-unknown-linux-musl"
BAT_TAR_GZ=""$BAT_DIR".tar.gz"
BAT_BIN="/usr/bin/bat"

if [ ! -f "$BAT_BIN" ]
then
  echo -e $BLUE"### Downloading Bat "$BAT_VERSION" "$RESET
  bat_fail=0
  (wget --no-check-certificate https://github.com/sharkdp/bat/releases/download/v"$BAT_VERSION"/"$BAT_TAR_GZ" > /dev/null 2>&1) || bat_fail=1
  if [[ $bat_fail -ne 0 ]];
  then
    echo -e $RED"### Failed to download Bat"$RESET
  else
    echo -e $GREEN"### Setting up Bat on the system"$RESET
    tar -xf "$BAT_TAR_GZ"
    sudo mv "$BAT_DIR"/bat "$BAT_BIN"
    sudo chmod +x "$BAT_BIN"
    rm "$BAT_TAR_GZ"
    rm -r "$BAT_DIR"
  fi
else
  echo -e $CYAN"### Bat bin already exists, skipping!"$RESET
fi


# Exa
EXA_VERSION="0.8.0"
EXA_DIR="exa-linux-x86_64-"$EXA_VERSION""
EXA_ZIP=""$EXA_DIR".zip"
EXA_BIN="/usr/bin/exa"

if [ ! -f "$EXA_BIN" ]
then
  echo -e $BLUE"### Downloading Exa "$EXA_VERSION" "$RESET
  exa_fail=0
  (wget --no-check-certificate https://github.com/ogham/exa/releases/download/v"$EXA_VERSION"/"$EXA_ZIP" > /dev/null 2>&1) || exa_fail=1
  if [[ $exa_fail -ne 0 ]];
  then
    echo -e $RED"### Failed to download Exa"$RESET
  else
    echo -e $GREEN"### Setting up Exa on the system"$RESET
    unzip "$EXA_ZIP" > /dev/null 2>&1
    sudo mv exa-linux-x86_64 "$EXA_BIN"
    sudo chmod +x "$EXA_BIN"
    rm "$EXA_ZIP"
  fi
else
  echo -e $CYAN"### Exa bin already exists, skipping!"$RESET
fi


# ZSH 
# TODO fix installation option
sudo apt install zsh
sudo apt-get install zsh-syntax-highlighting
sudo apt-get install powerline fonts-powerline
sudo apt-get install zsh-theme-powerlevel9k
sh -c "$(wget --no-check-certificate https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Compton
sudo apt install compton

function cli_tools() {
  echo "hej"
}
