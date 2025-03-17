1. Run `setup.sh`
2. Configure p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

`p10k configure`
autosuggestions plugin
git aliases
git config --global --type bool push.autoSetupRemote true

Syntax Highlighting
brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh -> ~/.zshrc

Auto-suggestion
brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh -> ~/.zshrc

Enable git & aliases plugins
plugins=(git aliases)
