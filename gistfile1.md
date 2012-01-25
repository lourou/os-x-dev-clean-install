disable window animations
-------------------------
`defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false`

enable key repeat
-----------------
`defaults write -g ApplePressAndHoldEnabled -bool false`

install webkit
--------------
`open http://webkit.org`

disable webkit homepage
-----------------------
`defaults write org.webkit.nightly.WebKit StartPageDisabled -bool YES`

install chrome
--------------
`open http://google.com/chrome`

install iterm 2
----------------
`open http://iterm2.com`

install transmit
----------------
`open http://panic.com/transmit`

install coda
------------
`open http://panic.com/coda`

set hostname
------------
`sudo scutil --set HostName Joel`

#git

install git
-----------
open http://code.google.com/p/git-osx-installer/downloads/list?can=3

setup github
------------
open http://help.github.com/mac-set-up-git

set default git editor
----------------------
git config --global core.editor "subl -w"


install z-shell
---------------
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh



#Sublime Text

install sublime text dev build
------------------------------
`open http://www.sublimetext.com/dev`

install package control
-----------------------
open http://wbond.net/sublime_packages/package_control/installation

install tomorrow theme
----------------------
```
git clone git://github.com/ChrisKempson/TextMate-Tomorrow-Theme.git /Users/Joel/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Tomorrow
```


install mensch font
-------------------
open http://robey.lag.net/2010/06/21/mensch-font.html




#mimic server

#install dnsmasq
brew install dnsmasq

#save dns settings
echo "address=/dev/127.0.0.1" > /usr/local/etc/dnsmasq.conf && 
echo "address=/build/127.0.0.1" >> /usr/local/etc/dnsmasq.conf && 
echo "address=/stage/192.168.10.200" >> /usr/local/etc/dnsmasq.conf && 
echo "listen-address=127.0.0.1" >> /usr/local/etc/dnsmasq.conf
