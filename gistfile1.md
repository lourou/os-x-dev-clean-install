[Mensch font](http://robey.lag.net/2010/06/21/mensch-font.html), 
[Source Code Pro](http://sourceforge.net/projects/sourcecodepro.adobe/files/),
[Webkit](http://webkit.org),
[Chrome](http://google.com/chrome),
[Firefox](http://firefox.com),
[Kaleidoscope](http://www.kaleidoscopeapp.com),
[iTerm](http://iterm2.com),
[Sublime Text](http://www.sublimetext.com/dev),
[Sequel Pro](http://nightly.sequelpro.com),
[Codekit](http://incident57.com/codekit/),
[ImageOptim](http://imageoptim.com),
[XQuartz](http://xquartz.macosforge.org/trac/wiki)

### OS X Preferences

---

```bash
#Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

#Enable repeat on keydown
defaults write -g ApplePressAndHoldEnabled -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

#Disable ext change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#Disable webkit homepage
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

#Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

#Disable sound effect when changing volume 
defaults write -g com.apple.sound.beep.feedback -integer 0

#Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

#Enable AirDrop over Ethernet and on unsupported Macs
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true &&
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true &&
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true &&
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

#Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

#Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true


# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false


# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 &&
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true &&
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1 &&
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true &&
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true &&
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true &&
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Show the ~/Library folder
chflags nohidden ~/Library

#Show absolute path in finder's title bar. 
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

```

###Shell

---

####Switch to z-shell

```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```


####Homebrew


```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

```bash
brew install wget node jpegoptim pngcrush redis memcached libmemcached colordiff imagemagick icoutils ack
```


####Update .zshrc

```bash
wget https://gist.github.com/saetia/2764210/raw/ef18e4013ed7d11e400527268bfaff0b7b0e4a70/.zshrc -O ~/.zshrc

#syntax highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

####Set hostname

`sudo scutil --set HostName Work`




###Git

---

####Setup Github

```bash
ssh-keygen -t rsa -C "saetia@gmail.com"

#copy ssh key to clipboard for adding to github.com
pbcopy < ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name "Joel Glovacki" && 
git config --global user.email "saetia@gmail.com" &&
git config --global github.user saetia && 
git config --global core.editor "subl -w" &&
git config --global color.ui true &&
git config --global push.default simple

#token
git config --global github.token your_token_here
```

###Coda

---

####Install markdown support

```bash
git clone https://github.com/bobthecow/Markdown.mode.git ~/Library/Application\ Support/Coda\ 2/modes/Markdown.mode
```

###Sublime Text

---

####Add Sublime Text CLI

```bash
sudo mkdir -p "/usr/local/bin/" && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"
```


####Install Soda Theme

```bash
git clone git://github.com/buymeasoda/soda-theme.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Theme\ -\ Soda
```

####Install Tomorrow Theme

```bash
git clone git://github.com/chriskempson/textmate-tomorrow-theme.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Color\ Scheme\ -\ Tomorrow
```

####Settings


```json
{
	"close_windows_when_empty": true,
	"color_scheme": "Packages/Color Scheme - Tomorrow/Tomorrow-Night-Eighties.tmTheme",
	"draw_indent_guides": false,
	"font_face": "Source Code Pro",
	"font_size": 22.0,
	"highlight_modified_tabs": true,
	"ignored_packages":
	[
		"Vintage"
	],
	"show_full_path": true,
	"show_tab_close_buttons": false,
	"spell_check": false,
	"tab_size": 2,
	"theme": "Soda Light.sublime-theme",
	"word_separators": "./\\()\"'-:,.;<>~!@#%^&*|+=[]{}`~?"
}

```

####Key Bindings


```json
[
	{ "keys": ["super+b"], "command": "expand_selection", "args": {"to": "brackets"} },
	{ "keys": ["super+f"], "command": "show_panel", "args": {"panel": "replace"} },
	{ "keys": ["super+alt+f"], "command": "show_panel", "args": {"panel": "find"} }
]
```


####Snippets

```bash
git clone git@github.com:bytestudios/sublime-snippets.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Byte
```




### Ruby

---

#### Ruby version manager

```bash
curl -L https://get.rvm.io | bash -s stable --rails
```


#### Gems
```
gem install pygmentize growl guard guard-phpunit bropages
```



### Node

---

#### Packages

```
npm install -g coffee-script
```



### Local Webserver

---

#### Install dnsmasq, Add DNS Domains, Enable dnsmasq daemon

This will route requests to any url ending in **.build** back to your own computer. The goal is to use urls like http://example.com.build for development while you work on http://example.com

```bash
brew install dnsmasq && 
mkdir -pv $(brew --prefix)/etc/ &&
echo 'address=/.build/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf &&
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons &&
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist &&
sudo mkdir -v /etc/resolver &&
sudo zsh -c 'echo "nameserver 127.0.0.1" > /etc/resolver/build'

#flush cache
#Yosemite
sudo discoveryutil mdnsflushcache
#Mavericks
sudo killall -HUP mDNSResponder
#ensure it works
scutil --dns
```




####Enable virtual hosts

This will allow you to serve folders under ~/Sites/ as websites. 

* ~/Sites
  * example.com
    * htdocs
      * index.html

to access this site, visit http://example.com.build

```bash
sudo touch "/etc/apache2/users/$USER.conf"
subl "/etc/apache2/users/$USER.conf"
```

```bash
DocumentRoot "/Users/Joel/Sites/"
NameVirtualHost *:80
<Directory "/Users/Joel/Sites/">
    Options Indexes MultiViews FollowSymLinks Includes
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>
<VirtualHost *:80>
    UseCanonicalName off
    VirtualDocumentRoot /Users/Joel/Sites/%-2+/htdocs
</VirtualHost>
```



####Apache Config


```bash
sudo wget https://gist.github.com/saetia/6096745/raw/8a4b8a752f26e3841fa2d91586e70723006e2f12/httpd.conf -O /etc/apache2/httpd.conf
```

####Enable centOS style /var/www/vhosts for local dev


```bash
sudo mkdir -p /var/www/ &&
sudo ln -s ~/Sites /var/www/vhosts
```





####XDebug



```bash
brew install https://github.com/josegonzalez/homebrew-php/raw/master/Formula/xdebug-php.rb
```

####MySQL


```bash
brew install mysql
```

####MySQL Settings


```bash

#setup daemon
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

#start mysql
mysql.server start

#secure mysql
/usr/local/opt/mysql/bin/mysql_secure_installation
```



####Configure php.ini


```bash
sudo wget https://gist.github.com/saetia/6096739/raw/837b02be80f31edf73767e9b3d0ba2f765ee4be4/php.ini -O /etc/php.ini
```


####Restart apache

```bash
sudo apachectl graceful
```



####PHPUnit

```bash
cd /usr/lib/php &&
sudo php install-pear-nozlib.phar &&
sudo pear channel-update pear.php.net &&
sudo pecl channel-update pecl.php.net &&
sudo pear upgrade-all &&
sudo pear channel-discover pear.phpunit.de  &&
sudo pear channel-discover components.ez.no &&
sudo pear channel-discover pear.symfony-project.com &&
sudo pear channel-discover pear.symfony.com &&
sudo pear install --alldeps phpunit/PHPUnit && 
pear install phpunit/phpunit_selenium
```





![aww yeah](http://i.imgur.com/AmFax.gif)