#disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

#enable key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

#install webkit
open http://webkit.org

#disable webkit homepage
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool YES

#install chrome 
open http://google.com/chrome

#install iterm 2 
open http://iterm2.com

#install transmit & coda
open http://panic.com/transmit
open http://panic.com/coda

#set hostname
sudo scutil --set HostName Joel

#install git
open http://code.google.com/p/git-osx-installer/downloads/list?can=3

#setup github
open http://help.github.com/mac-set-up-git

#install zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

#set default git editor
git config --global core.editor "subl -w"

#install package control
open http://wbond.net/sublime_packages/package_control/installation

#install mensch font
open http://robey.lag.net/2010/06/21/mensch-font.html

#install tomorrow theme
git clone git://github.com/ChrisKempson/TextMate-Tomorrow-Theme.git /Users/Joel/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Tomorrow