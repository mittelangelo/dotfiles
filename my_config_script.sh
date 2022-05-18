#!/bin/bash

YELLOW="\033[1;33m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

echo "---------------------------------------------------------"
echo "----- ${YELLOW} Welcome to your new Computer          ---"
echo "-----  Lets make it feel like a old friend ${NOCOLOR} ---"
echo "---------------------------------------------------------"
echo "---------------------------------------------------------"
echo "---------------------------------------------------------"
echo "------ ${YELLOW}   Brew init         ${NOCOLOR}  --------"
echo "---------------------------------------------------------"

# download brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# setup brew
brew update
brew upgrade
brew analytics off

echo "------------------------------------------------------------------"
echo "------ ${YELLOW}   Brew install       ${NOCOLOR}          --------"
echo "------------------------------------------------------------------"

brew install \
git \
watch \ 
kubectl \ 
helm \
ghostscript \
coreutils \
k9s \
neovim \
nmap \
ranger \
tmux \
tldr \
youtube-dl \
zsh-autosuggestions \
zsh-completions \
imagemagick 

echo "------------------------------------------------------------------"
echo "------  ${YELLOW}  Brew install cask   ${NOCOLOR}         --------"
echo "------------------------------------------------------------------"

brew install -cask \
firefox \
docker \
audacity \
iterm2 \
vscodium \
rectangle \
michaelvillar-timer \
drawio \
bitwarden \
signal \
slack \
gimp \
veracrypt \
filezilla \
protonmail-bridge \
protonvpn \
teamviewer \
oversight \
blockblock \
ransomwhere \
libreoffice \
screaming-frog-seo-spider \
ledger-live \
atom \
little-snitch \
microsoft-teams \
zoomus  

# clenaup install process
brew cleanup

echo "------------------------------------------------------------------"
echo "------  ${YELLOW}  Tmux init          ${NOCOLOR}          --------"
echo "------------------------------------------------------------------"

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "------------------------------------------------------------------"
echo "------  ${YELLOW}  Vimrc init        ${NOCOLOR}            --------"
echo "------------------------------------------------------------------"

cd
echo ":set colorscheme evening \ :set hlsearch \ :set ignorecase" > ./.vimrc

echo "--------------------------------------------------------------------"
echo "------  ${YELLOW} Apply  Apple configs  ${NOCOLOR}          --------"
echo "--------------------------------------------------------------------"

# Show all files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Config for no time between keypresses
defaults write -g ApplePressAndHoldEnabled -bool false

# System - Disable the 'Are you sure you want to open this application?' dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Finder - Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder - Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# "Safari - Set home page to 'about:blank' for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# "Safari - Disable sending search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# "TextEdit - Use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0

# Finder - Use list view in all Finder windows
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder - Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# System - Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# System - Disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# no open application animation
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# no dock launch app animation
defaults write com.apple.dock launchanim -bool false

# dock autohide no delay
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

# showing and hiding Launchpad
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

# showing and hiding sheets, resizing preference windows, zooming windows
# float 0 doesn't work
defaults write -g NSWindowResizeTime -float 0.001

# opening and closing Quick Look windows
defaults write -g QLPanelAnimationDuration -float 0

# scrolling column views
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0

# save as & dialog box speed
defaults write NSGlobalDomainNS WindowResizeTime .001

# Restart Finder and Dock
killall Finder
killall Dock

echo "-------------------------------------------------------------------------"
echo "------  ${YELLOW}  CHANGE .zshrc (plugins) ${NOCOLOR}--------------------"
echo "-------------------------------------------------------------------------"

# Change the line 73 - ugly hardcoded ik 
sed "73s/.*/plugins=(git zsh-vi-mode history-substring-search zsh-autosuggestions)/" ./.zshrc > ./.zshrc-copy
rm ./.zshrc
mv ./.zshrc2 ./.zshrc


echo "-------------------------------------------------------------------------"
echo "------  ${YELLOW} Things you need to install manually: ${NOCOLOR}--------"
echo "-------------------------------------------------------------------------"

echo "${YELLOW}"
echo "Cider - Open Source Apple Music Client"
echo "https://github.com/ciderapp/Cider"

echo "-----------------------"

echo "Little Snitch - Outbound network manager"
echo "https://www.obdev.at/products/littlesnitch/download.html"

echo "-----------------------"
echo "Firefox"
echo "> about:config"
echo " - media.peerconnection.enabled - false "
echo "> add-ons"
echo " - ublock Origin"

echo "-----------------------"
echo "${NOCOLOR}"


