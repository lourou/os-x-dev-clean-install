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
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

#Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

#Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController \
SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 && \
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1 && \
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Show the ~/Library folder
chflags nohidden ~/Library

#Show absolute path in finder's title bar. 
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

#Enable text copying from Quick Look
com.apple.finder QLEnableTextSelection -bool YES

```

###Shell

---

####Switch to z-shell

```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```


####Homebrew


```bash
#install package manager
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install homebrew packages
brew install \
tree \
node \
dnsmasq \
nginx \
mariadb \
ssh-copy-id \
wget \
jpegoptim \
pngcrush \
redis \
memcached \
libmemcached \
colordiff \
imagemagick \
icoutils \
ack \
caskroom/cask/brew-cask
```

####Homebrew Cask Apps

```bash
#install mac apps
brew cask install \
coda \
sublime-text \
coderunner \
google-chrome \
firefox \
codekit \
iterm2 \
sequel-pro \
querious \
imageoptim \
imagealpha \
xquartz \
simpholders \
handbrake \
vagrant \
ksdiff
```


####Update .zshrc

```bash
wget https://gist.github.com/saetia/2764210/raw/ef18e4013ed7d11e400527268bfaff0b7b0e4a70/.zshrc -O \
~/.zshrc

#syntax highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

####Set hostname

```bash
sudo scutil --set HostName Work
```

####Source Code Pro
```bash
curl https://codeload.github.com/adobe-fonts/source-code-pro/tar.gz/1.017R | tar -xz && \
cp ~/source-code-pro-1.017R/OTF/*.otf ~/Library/Fonts && \
rm -rf ~/source-code-pro-1.017R
```


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
git clone https://github.com/bobthecow/Markdown.mode.git \
~/Library/Application\ Support/Coda\ 2/modes/Markdown.mode
```

###Sublime Text

---

####Add Sublime Text CLI

```bash
sudo mkdir -p "/usr/local/bin/" && \
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" \
"/usr/local/bin/subl"
```


####Install Soda Theme

```bash
git clone git://github.com/buymeasoda/soda-theme.git \
~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Theme\ -\ Soda
```

####Install Tomorrow Night Eighties Themes

```bash
#Sublime Text
git clone git://github.com/chriskempson/textmate-tomorrow-theme.git \
~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Color\ Scheme\ -\ Tomorrow

#iTerm2
wget https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Tomorrow%20Night%20Eighties.itermcolors \
-O ~/Downloads/Tomorrow\ Night\ Eighties.itermcolors && open ~/Downloads/Tomorrow\ Night\ Eighties.itermcolors

#Xcode
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes && \
wget https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/Xcode%204/Tomorrow%20Night%20Eighties.dvtcolortheme -O \
~/Library/Developer/Xcode/UserData/FontAndColorThemes/Tomorrow\ Night\ Eighties.dvtcolortheme
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
git clone git@github.com:co-b/sublime-snippets.git \
~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Byte
```

### iOS
---

### Ruby
---

#### Ruby version manager

```bash
curl -L https://get.rvm.io | bash -s stable --rails
```

#### Gems
```bash
gem install pygmentize growl guard guard-phpunit bropages
```



### Node
---

#### Packages

```bash
npm install -g coffee-script bower
```




### Vagrant
---

```bash
vagrant plugin install vagrant-hostsupdater
```


### PHP
---

```bash
#install php-fpm
brew tap homebrew/dupes && \
brew tap homebrew/versions && \
brew tap homebrew/dupes && \
brew install php56 \
--with-fpm \
--without-apache \
--with-mysql

#setup daemon
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents && \
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
```


####MariaDB

```bash

#setup daemon
ln -sfv /usr/local/opt/mariadb/*.plist ~/Library/LaunchAgents && \
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

#initial setup
mysql_install_db

#secure mariadb
mysql_secure_installation
```

####NGINX

```bash
sudo cp -v /usr/local/opt/nginx/*.plist /Library/LaunchDaemons/ && 
sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.nginx.plist &&
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
```

### Local Web Server
---

#### Add DNS Domains, Enable dnsmasq daemon

This will route requests to any url ending in **.build** back to your own computer. The goal is to use urls like http://example.com.build for development while you work on http://example.com

```bash
mkdir -pv $(brew --prefix)/etc/ && \
echo 'address=/.build/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf && \
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons && \
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist && \
sudo mkdir -v /etc/resolver && \
sudo zsh -c 'echo "nameserver 127.0.0.1" > /etc/resolver/build'

#flush cache
sudo discoveryutil mdnsflushcache && scutil --dns
```

####Enable virtual hosts

This will allow you to serve folders under ~/Sites/ as websites. 

* ~/Sites
  * example.com
    * htdocs
      * index.html
  
to access this site, visit http://example.com.build


####Match production server paths
```bash
sudo mkdir -p /var/ && sudo ln -s ~/Sites /var/www
```



![aww yeah](http://i.imgur.com/AmFax.gif)