#!/bin/bash
# Install dev tools

read -p "Install xcode? (y/n) " yesorno

if [[ $yesorno = "y" ]]
then
  sudo xcode-select --install
  sudo xcodebuild -license
fi 

cd ~/Downloads

read -p $'\x0aInstall Homebrew? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  printf "\nInstalling Homebrew"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo >> /Users/gabrieladombrowski/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/gabrieladombrowski/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

read -p $'\x0aInstall git? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  echo "\nInstalling git"
  brew install git

  read -p $'\x0aUse main as default branch name? (y/n) ' main_default
  if [[ $main_default = y ]]
  then
    git config --global init.defaultBranch main
  fi
fi

#read -p $'\x0aInstall spotify in your terminal? (y/n) ' yesorno

#if [[ $yesorno = "y" ]]
#then
  #brew install spotifyd
  #brew install Rigellute/tap/spotify-tui

  #echo "\nRun Spotify CLI: `spt`"
#fi

mkdir -p iterm2

#read -p  "Enter iterm2 checksum (found at https://iterm2.com/downloads.html under changelog): " iterm2_check_changelog

read -p $'\x0aInstall iterm2? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  filename=~/Downloads/iterm2/iterm2zip
  curl -O https://iterm2.com/downloads/stable/latest > $filename

  echo "\nTo save your iterm2 settings, select a folder under Preferences -> General and click Save settings to Folder"
  read -p $'\x0aEnter iterm2 settings URL or skip: ' iterm2_settings

  if [[ $iterm2_settings != "skip" ]]
  then
    read -p $'\x0aEnter url: ' iterm_settings_url
    curl -O $iterm_settings_url > ~/iterm_settings

    echo $'\x0aSelect the saved file at ~/iterm_settings  under `Preferences -> General` in iterm'
  fi
fi

#iterm2_check_download=$(shasum -a 256 "$filename" | awk '{print $1}')

#echo $iterm2_check_changelog
#echo "first"
#echo $iterm2_check_download
#echo "second"

#if $iterm2_check_changelog = $iterm_check_download
#then
#  break
#else
#  echo "Checksums for iterm2 do not match"
#  exit
#fi

read -p $'\x0aInstall ohmyzsh? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

read -p $'\x0aEnter ohmyzsh settings URL or skip: ' ohmyzsh_settings

if [[ $ohmyzsh_settings != "skip" ]]
then
  read -p $'\x0aEnter url: ' ohmyzsh_settings_url
  curl -O $ohmyzsh_settings_url > ~/.zshrc
fi

read -p $'\x0aWould you like to install insomnia? (y/n) ' yesorno
if [[ $yesorno = "y" ]]
then
  brew install --cask insomnia
fi

read -p $'"\x0aWould you like to clone a github repo? (y/n) ' yesorno
while [[ $yesorno = "y" ]]; do
  read -p $'\x0aEnter local directory path you want to use: ' repo_dir
  read -p $'\x0aEnter the github : ' repo_url

  mkdir -p $repo_dir
  cd $repo_dir
  git clone $repo_url

  read -p $'\x0aIs there another repo you'd like to clone? (y/n) ' yesorno
done

#Install Slack
#Install Spotify
#Install VSCode and sync
#Install Firefox and sync
#Install spectacles
#Save and import iterm2 profiles & settings
#https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/
#
#Github SSH
##Setup SSH: https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh
##Add new SSH: https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

