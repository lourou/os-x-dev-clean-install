#Mac OS X

[Mensch coding font](http://robey.lag.net/2010/06/21/mensch-font.html)

Disable window animations
-------------------------
```bash
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
```

Enable key repeat
-----------------
```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

Apps
----
* [Webkit](http://webkit.org)
* [Chrome](http://google.com/chrome)
* [Firefox](http://firefox.com)
* [iTerm](http://iterm2.com)
* [Transmit](http://panic.com/transmit)
* [Coda](http://panic.com/coda)
* [Sublime Text](http://www.sublimetext.com/dev)


Disable webkit homepage
-----------------------
```bash
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true
```

Set hostname
------------
`sudo scutil --set HostName Joel`

#Git

[Git Installer](http://code.google.com/p/git-osx-installer/downloads/list?can=3)

Setup Github
------------
```bash
ssh-keygen -t rsa -C "saetia@gmail.com"

#copy ssh key to github.com
subl ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name "Joel Glovacki"
git config --global user.email "saetia@gmail.com"
git config --global github.user saetia
git config --global github.token your_token_here
git config --global core.editor "subl -w"
```

#Shell

Install z-shell
---------------
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


#Sublime Text

Install package control
-----------------------
```python
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print 'Please restart Sublime Text to finish installation'
```

Install Tomorrow theme
----------------------
```bash
git clone git://github.com/ChrisKempson/TextMate-Tomorrow-Theme.git /Users/Joel/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Tomorrow
```


#Server

Install dnsmasq
---------------
```bash
brew install dnsmasq
```

save dns settings
-----------------
```bash
echo "address=/dev/127.0.0.1" > /usr/local/etc/dnsmasq.conf && 
echo "address=/build/127.0.0.1" >> /usr/local/etc/dnsmasq.conf && 
echo "address=/stage/192.168.10.200" >> /usr/local/etc/dnsmasq.conf && 
echo "listen-address=127.0.0.1" >> /usr/local/etc/dnsmasq.conf
```