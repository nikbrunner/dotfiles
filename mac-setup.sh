# nibru's Mac Install Script

# TODO
# - [ ] Clean out zshrc

# - Dotfiles -
echo "Setting up Dotfiles"
mkdir $HOME/dotfiles
git init --bare $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' | zsh
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:nikbrunner/dotfiles-apple.git
dotfiles pull origin master

# - SSH Setup -
# Generate a new ssh-keypair
echo "Setting up SSH Key"
ssh-keygen -t ed25519 -C "nibru@mbp"

# Add public ssh key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub
echo "Your public ssh key is created and copied to your clipboard!"

# Add public ssh key to GitHub
echo "Add the ssh-key to your GitHub account from your clipboard. Press any key to continue afterwards."
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "Waiting for the keypress."
fi
done

# Test the connection
ssh -T git@github.com

# - Homebrew -
echo |"Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" | zsh

# - Installing Apps -
echo "Start installing apps with Homebrew"

# General Apps
brew install --cask 1password
brew install --cask karabiner-elements
brew install --cask firefox
brew install --cask google-chrome
brew install --cask obsidian
brew install --cask spotify
brew install --cask amethyst
brew install --cask alfred

# Messenger and their dependencies
brew install --cask slack
brew install --cask skype
brew install --cask telegram
brew install --cask signal
brew install --cask camo-studio

# Development Apps
brew install --cask visual-studio-code
brew install --cask webstorm
brew install --cask iterm2
brew install --cask insomnia
brew install --cask docker

# Design Apps
brew install --cask adobe-creative-cloud
brew install --cask hype
brew install --cask sketch

echo "All Apps installed!"

# - Oh-my-zsh -
echo "Installing Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" | zsh

# - NVM -
echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh


# Manually install from App Store
# - Hotkey
# - Yoink
# - Pasta

# Install from Website
# - pcloud


