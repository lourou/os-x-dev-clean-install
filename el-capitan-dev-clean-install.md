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

# Switch to dark menu bar
defaults write NSGlobalDomain AppleInterfaceStyle Dark; killall Dock


```

##Shell

### Switch to zsh

```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

### Update .zshrc

```bash
#syntax highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### Autojump

Autojup is a cd command that learns - easily navigate directories from the command line.

    brew install autojump

### Powerline Shell

```bash
cd ~/
git clone https://github.com/milkbikis/powerline-shell
cd powerline-shell
./install.py
```

Add the following to your `.zshrc`:

```bash
function powerline_precmd() {
    PS1="$(~/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
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

Reinstall curl with openssl:

    brew reinstall --with-openssl curl

Then install PHP

    brew install -v --with-fpm \
    --without-apache \
    --with-mysql \
    --with-homebrew-curl \
    --with-homebrew-openssl \
    --disable-opcache \
    php56

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
    date.timezone = "Europe/Paris"
    error_reporting = E_ALL
    memory_limit = 512M

    log_errors=On
    error_log=/var/log/php-fpm/error.log

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
    xdebug.profiler_output_dir = /Users/louis/.Trash

### Installing Drush

Drush is a command line tool for Drupal

    brew install drush

## MariaDB

### Installing MariaDB

    brew install mariadb
    mysql_install_db

### Configuring MariaDB

You can start MariaDB now:

    mysql.server start

We will now set a root password and make the installation more secure:

    mysqladmin -u root password 'new-password'
    mysql_secure_installation

Deactivate Binary Logs as we do not need replication:

    mysql -uroot -p
    SET sql_log_bin = 0;
    exit

Restart MariaDB and check if log_bin = OFF:

    mysql.server restart
    mysql -uroot -p
    SHOW VARIABLES LIKE 'log_bin';
    exit

### Launch MariaDB at login

After everything is set up, you may want to use launchctl to start mariadb at login:

    mysql.server stop
    ln -sfv /usr/local/opt/mariadb/*.plist ~/Library/LaunchAgents

Then to load/unload mariadb:

    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist 

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
sublime-text-dev \
google-chrome \
firefox \
opera \
codekit \
sequel-pro \
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
vmware-fusion \
textexpander \
androidtool

#install music apps
brew cask install \
ableton-live-suite \
vlc \
cycling74-max

#install encfs
brew cask install osxfuse
brew install homebrew/fuse/encfs

#install Speedtest command line interface
sudo pip install speedtest-cli


```


## Git

### Setup Github

```bash
ssh-keygen -t rsa -C "email@domain.com"

# Copy ssh key to clipboard for adding to github.com
pbcopy < ~/.ssh/id_rsa.pub

# Test connection
ssh -T git@github.com

# Set git config values
git config --global user.name "Full Name" && \
git config --global user.email "email@domain.com" && \
git config --global github.user githubusername && \
git config --global core.editor "subl -w" && \
git config --global color.ui true && \
git config --global push.default simple

#token
git config --global github.token your_token_here
```


## Sublime Text

### Install Soda Theme

```bash
git clone git://github.com/buymeasoda/soda-theme.git \
~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Theme\ -\ Soda
```

### Install Tomorrow Night Eighties Themes

```bash
#Sublime Text
git clone git://github.com/chriskempson/textmate-tomorrow-theme.git \
~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Color\ Scheme\ -\ Tomorrow

# iTerm2
wget https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Tomorrow%20Night%20Eighties.itermcolors \
-O ~/Downloads/Tomorrow\ Night\ Eighties.itermcolors && open ~/Downloads/Tomorrow\ Night\ Eighties.itermcolors

# Xcode
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes && \
wget https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/Xcode%204/Tomorrow%20Night%20Eighties.dvtcolortheme -O \
~/Library/Developer/Xcode/UserData/FontAndColorThemes/Tomorrow\ Night\ Eighties.dvtcolortheme
```

### Settings

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

### Key Bindings


```json
[
	{ "keys": ["super+b"], "command": "expand_selection", "args": {"to": "brackets"} },
	{ "keys": ["super+f"], "command": "show_panel", "args": {"panel": "replace"} },
	{ "keys": ["super+alt+f"], "command": "show_panel", "args": {"panel": "find"} }
]
```


### Snippets

```bash
git clone git@github.com:co-b/sublime-snippets.git \
~/Library/Application\ Support/Sublime\ Text\ 3/Packages/CoB
```

## iOS

```bash
sudo gem install cocoapods
pod setup
```

## Ruby Gems

```bash
sudo gem install net-sftp dandelion
```

## Node Packages

```bash
npm install -g coffee-script bower
```

## LaTeX

Download MacTeX.pkg (2.3 Go): http://www.tug.org/mactex/

Add Latex binary to PATH variable:

    export PATH="/usr/local/bin:/usr/local/sbin:/Library/TeX/texbin:/

####MariaDB // Remove

```bash

#setup daemon
ln -sfv /usr/local/opt/mariadb/*.plist ~/Library/LaunchAgents && \
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist

#initial setup
mysql_install_db

#secure mariadb
mysql_secure_installation
```

####NGINX // Remove

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

- https://gist.github.com/saetia/1623487
- https://github.com/OzzyCzech/dotfiles/blob/master/how-to-install-mac.md
- http://www.tug.org/mactex/elcapitan.html
- http://www.math.univ-toulouse.fr/~mleroy/LaTeX/Install_MacOSX_mactex.pdf
