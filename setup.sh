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

  ADDTOPATH="y"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ $ADDTOPATH = "y" ]]
then
  printf "\nAdding Homebrew to PATH"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/gabidombrowski/.zprofile
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

read -p $'\x0aInstall spotify in your terminal? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  brew install spotifyd
  brew install Rigellute/tap/spotify-tui

  echo "\nRun Spotify CLI: `spt`"
fi

mkdir -p iterm2

read -p $'\x0aInstall iterm2? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  filename=~/Downloads/iterm2/iterm2zip
  curl -O https://iterm2.com/downloads/stable/latest > $filename

  #echo "\nTo save your iterm2 settings, select a folder under Preferences -> General and click Save settings to Folder"
  #read -p $'\x0aEnter iterm2 settings URL or skip: ' iterm2_settings

  #if [[ $iterm2_settings != "skip" ]]
  #then
   #read -p $'\x0aEnter url: ' iterm_settings_url
   #curl -O $iterm_settings_url > ~/iterm_settings

    #echo $'\x0aSelect the saved file at ~/iterm_settings  under `Preferences -> General` in iterm'
  #fi
fi

read -p $'\x0aWould you like to install Insomnia? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  brew install --cask insomnia
fi

read -p $'\x0Install VSCode? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  brew install --cask visual-studio-code
fi

read -p $'\x0Install Spectacle? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  brew install --cask spectacle
fi

read -p $'\x0Install Firefox? *y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  brew install --cask firefox
fi

read -p $'\x0aInstall ohmyzsh? (y/n) ' yesorno

if [[ $yesorno = "y" ]]
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  #Syntax highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  #Autocomplete
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
  #Autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  #Add plugin names to ~/.zshrc
  #Powerlevel10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  #Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.
fi

read -p $'\x0aEnter ohmyzsh settings URL or skip: ' ohmyzsh_settings

if [[ $ohmyzsh_settings != "skip" ]]
then
  read -p $'\x0aEnter url: ' ohmyzsh_settings_url
  curl -O $ohmyzsh_settings_url > ~/.zshrc
fi

#Install Slack
#Sync VSCode
#Install Firefox and sync
#Save and import iterm2 profiles & settings
#TODO
#Fix Spotify run command print
#Pause on xcode install
#Fix iterm settings
#https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/
#
#Github SSH
##Setup SSH: https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh
##Add new SSH: https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
