## Bypass OS X System Integrity Protection

- Reboot the mac pressing CMD + R
- Open Utilities/Terminal
- Type:

```bash
    bashcsrutil disable; reboot
```

## OS X Preferences

Most of these require logout/restart to take effect

```bash
# Enable character repeat on keydown
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable window animations ("new window" scale effect)
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Turn on dashboard-as-space
defaults write com.apple.dashboard enabled-state 2

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Make top-left hotspot start screensaver
defaults write com.apple.dock wvous-tl-corner -int 5 && \
defaults write com.apple.dock wvous-tl-modifier -int 0

# Set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable file extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show absolute path in finder's title bar. 
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES


```

##Shell

### Switch to zsh

```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

### Homebrew Basics

```bash
# install package manager
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew packages
brew install \
tree \
ssh-copy-id \
wget \
jpegoptim \
pngcrush \
colordiff \
imagemagick \
graphicsmagick \
caskroom/cask/brew-cask \
youtube-dl
```

## Development Tools

### Installing nginx

    brew install nginx

- The default nginx port is set in /usr/local/etc/nginx/nginx.conf to 8080 so that nginx can run without sudo.
- nginx will load all files in /usr/local/etc/nginx/servers/.
- switch nginx from port 8080 to 80 and write error logs in /var/log/nginx:


    sudo mkdir /var/log/nginx
    sudo mkdir /var/log/php-fpm
    nano /usr/local/etc/nginx/nginx.conf
    error_log  /var/log/nginx/error.log;
    listen 80;
    sudo nginx (or sudo nginx -s reload)


### Installing PHP-FPM

Start with taping formulas repositories:

    brew tap homebrew/dupes
    brew tap homebrew/versions
    brew tap homebrew/homebrew-php

Remove all PHP dependencies (it's only safe way to compile PHP successfully)

    brew remove libtool
    brew remove freetype
    brew remove gettext
    brew remove icu4c
    brew remove jpeg
    brew remove libpng
    brew remove unixodbc
    brew remove zlib

Then install PHP

    brew install -v --with-fpm --with-mysql --disable-opcache php56

Install PHP extensions

    brew install php56-http
    brew install php56-mcrypt
    brew install php56-memcache
    brew install php56-memcached
    brew install php56-mongo
    brew install php56-opcache
    brew install php56-propro
    brew install php56-raphf
    brew install php56-tidy
    brew install php56-xdebug

We will now replace MacOS X PHP with the one we just installed.

Update `~/.zshrc` in order to have the PATH begining with:

    export PATH="/usr/local/bin:/usr/local/sbin:...

Restart Terminal and check if `php -v` or `php-fpm -v` gives you PHP version 5.6

### php-fpm.conf and php.ini

You can found basic php-fpm config file here `subl /usr/local/etc/php/5.6/php-fpm.conf`. Check especially `listen = 127.0.0.1:9000` everything else can be leave as is.

PHP config files can be found here `subl /usr/local/etc/php/5.6/conf.d/`. You can change `php.ini` but its more more easly keept change is spearate file:

    subl /usr/local/etc/php/5.6/conf.d/custom.ini

My configuration:

    short_open_tag = On
    display_errors = On
    display_startup_errors = On
    upload_max_filesize = 1024M
    post_max_size = 1024M
    date.timezone = "Europe/Prague"
    error_reporting = E_ALL
    memory_limit = 256M

    log_errors=On
    error_log=/tmp/php-error.log

    mysql.default_socket=/tmp/mysql.sock
    pdo_mysql.default_socket=/tmp/mysql.sock

    [opcache]
    opcache.revalidate_freq=1

    [xdebug]
    xdebug.remote_enable=1
    xdebug.remote_connect_back=On
    ;xdebug.remote_host=127.0.0.1
    ;xdebug.remote_port=9001
    xdebug.remote_autostart=1
    xdebug.idekey=PHPSTORM
    xhprof.output_dir="/var/tmp/xhprof"

    xdebug.profiler_enable = 0;
    xdebug.profiler_output_name=cachegrind.out.%H.%t
    xdebug.profiler_enable_trigger = 1;
    xdebug.profiler_output_dir = /Users/roman/.Trash

### Installing MariaDB

    brew install mariadb

### Update .zshrc

```bash
#syntax highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### Installing dandelion incremental deployment script

    sudo gem install dandelion

### Set hostname

```bash
sudo scutil --set HostName 10u15.local
```

### Agree To Xcode
```bash
sudo xcrun cc
```

## Mac Apps and fonts with Homebrew Cask

```bash
# add support for fonts
brew tap caskroom/fonts

#add dev/beta versions
brew tap caskroom/versions

#install mac apps & fonts
brew cask install \
1password \
font-source-code-pro \
adobe-creative-cloud \
blueharvest \
sublime-text-dev \
google-chrome \
firefox \
opera \
codekit \
sequel-pro \
querious \
imageoptim \
imagealpha \
bartender \
appdelete \
carbon-copy-cloner \
charles \
cloud \
colorpicker-developer \
dropbox \
evernote \
fabric \
flux \
focus \
handbrake \
kindle \
subler \
transmission \
transmit \
moom \
sourcetree \
slack \
skype \
screenhero \
pngyu \
synology-assistant \
omnifocus \
omnidisksweeper \
omnigraffle \
spotify \
scansnap-manager-ix100 \
vmware-fusion

#install music apps
brew cask install \
ableton-live-suite \
vlc \
cycling74-max

#install encfs
brew cask install osxfuse
brew install homebrew/fuse/encfs

```


## Git

####Setup Github

```bash
ssh-keygen -t rsa -C "saetia@gmail.com"

#copy ssh key to clipboard for adding to github.com
pbcopy < ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name "Joel Glovacki" && \
git config --global user.email "saetia@gmail.com" && \
git config --global github.user saetia && \
git config --global core.editor "subl -w" && \
git config --global color.ui true && \
git config --global push.default simple

#token
git config --global github.token your_token_here
```


###Sublime Text

---

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
~/Library/Application\ Support/Sublime\ Text\ 3/Packages/CoB
```

### iOS
---

```bash
sudo gem install cocoapods
pod setup
```

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
#switch from SecureTransport
brew reinstall --with-openssl curl

#install php-fpm
brew tap homebrew/dupes && \
brew tap homebrew/versions && \
brew tap homebrew/dupes && \
brew install php70 \
--with-fpm \
--without-apache \
--with-mysql \
--with-homebrew-curl \
--with-homebrew-openssl \ 
--without-snmp

#setup daemon
ln -sfv /usr/local/opt/php70/*.plist ~/Library/LaunchAgents && \
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php70.plist
```

####PHP-Redis
```bash
#brew install php70-redis
brew install --HEAD homebrew/php/php70-redis
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

## Credits

https://gist.github.com/saetia/1623487
https://github.com/OzzyCzech/dotfiles/blob/master/how-to-install-mac.md

