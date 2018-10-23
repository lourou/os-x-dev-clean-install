# macOS 10.4 Mojave Clean Install

This is my collection of commands to perform a clean install of macOS 10.14 Mojave.

Choose and execute the ones that fits your needs.

##  Get started

```bash

# Install Xcode Tools
# Automated install does not work anymore
# Download the cli tools at https://developer.apple.com/download/more/

# Install Brew package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install homebrew packages
brew install \
tree \
ssh-copy-id \
wget \
jpegoptim \
pngcrush \
colordiff \
imagemagick \
graphicsmagick \
youtube-dl \
autojump \
npm \
speedtest-cli
```

## Mac App Store

Note: the `mas` command line does not work yet on macOS 10.14.

```bash
brew install mas

# Display all apps that can be installed or search for them
mas list
mas search Xcode

# To install or update an application simply run mas install with an application identifier:
mas install 497799835
```

List of personal Mac App Store Apps:

- 468990782 Music Converter Pro (1.5.3)
- 931657367 Calcbot - The Smart Calculator (1.0.7)
- 1091189122 Bear (1.6.1)
- 506189836 Harvest (2.1.9)
- 595191960 CopyClip - Clipboard History Manager (1.9)
- 406825478 Telephone (1.3.1)

## OS X Preferences that need custom input

```bash
# Set Login Window Text
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "If you found this computer, please call +33 X XX XX XX XX"

# Set HostName
sudo scutil --set HostName yourhostname.local

# List Available Timezones
sudo systemsetup -listtimezones

# Set Timezone and Set Clock Using Network Time
sudo systemsetup -settimezone Europe/Paris
sudo systemsetup setusingnetworktime on
```

## OS X Preferences to make keyboard repeat very fast!

```bash
# Enable character repeat on keydown
# Set a shorter Delay until key repeat
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false && \
defaults write NSGlobalDomain KeyRepeat -int 1 && \
# defaults write NSGlobalDomain InitialKeyRepeat -int 10
```

## Shell

```bash
# Switch to zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Autojump setup: add the following line to your ~/.zshrc file
# Remember to source the file to update your current session
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Update .zshrc
# syntax highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

## Brew Cask for binary distributed software

```bash
# Install Cask
brew tap caskroom/cask
```
    
## Bypass OS X System Integrity Protection

- Reboot the mac pressing CMD + R
- Open Utilities/Terminal
- Type:

```bash
csrutil disable; reboot
```

## OS X Preferences

Most of these require logout/restart to take effect

```bash
# System - Disable cursor magnification
defaults write NSGlobalDomain CGDisableCursorLocationMagnification -bool YES

# System - Locale
defaults write NSGlobalDomain AppleMetricUnits -bool YES
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleLocale -string "fr_US@currency=EUR"

# System - Set decimal delimiter as dot instead of comma
defaults write NSGlobalDomain AppleICUNumberSymbols '{"0" = "."; "10" = "."; }'

# System - Monday is the first day of the week
defaults write NSGlobalDomain AppleFirstWeekday -dict 'gregorian' 2

# System - Disable hibernation (speeds up entering sleep mode)
# sudo pmset -a hibernatemode 0

# System - Allow 'locate' command
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist > /dev/null 2>&1

# Turn on dashboard-as-space
# defaults write com.apple.dashboard enabled-state 2

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Make bottom-left hotspot start screensaver
defaults write com.apple.dock wvous-bl-corner -int 5 && \
defaults write com.apple.dock wvous-bl-modifier -int 0

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

# Avoid creating .DS_Store files on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

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

# Prevent Time Machine from Prompting to Use New Hard Drives as Backup Volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Time Machine - Disable local Time Machine backups
# hash tmutil &> /dev/null && sudo tmutil disablelocal

# Time Machine - Disable local Time Machine snapshots
# sudo tmutil disablelocal

# Sets default save target to be a local disk, not iCloud.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Screensaver Lock with Password within 5 seconds
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Disable AirDrop
# defaults write com.apple.NetworkBrowser DisableAirDrop -bool YES

# Login Window preferences
# Enable secure guest access
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled 1

# Show language input menu
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu 1

# Prevent user list with picture to show up, display login and password field instead
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME 1

# System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# System - Disable software updates
sudo softwareupdate --schedule off

# Trackpad - Map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool trube

# Trackpad - Enable tap to click for current user and the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Dock - Remove all default app icons
defaults write com.apple.dock persistent-apps -array

# Dock - Automatically hide and show
defaults write com.apple.dock autohide -bool true

# Dock - Remove the auto-hiding delay
defaults write com.apple.Dock autohide-delay -float 0

# Dock - Don’t show Dashboard as a Space
defaults write com.apple.dock "dashboard-in-overlay" -bool true

# Finder - Use list view in all Finder windows
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder - Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# iOS Simulator - Symlink the iOS Simulator application
sudo ln -sf "/Applications/Xcode.app/Contents/Applications/iPhone Simulator.app" "/Applications/iOS Simulator.app"

# Safari - Set home page to 'about:blank' for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Safari - Hide bookmarks bar
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Safari - Use Contains instead of Starts With in search banners
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Safari - Disable sending search queries to Apple.
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# Chrome - Prevent native print dialog, use system dialog instead
defaults write com.google.Chrome DisablePrintPreview -boolean true

# Address Book - Enable debug menu
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# iCal - Setup
defaults write com.apple.iCal "IncludeDebugMenu" -bool TRUE
defaults write com.apple.iCal "showDeclinedEvents" -bool TRUE
defaults write com.apple.iCal "n days of week" -int 7
defaults write com.apple.iCal "SharedCalendarNotificationsDisabled" -bool TRUE
defaults write com.apple.iCal "TimeZone support enabled" -bool TRUE
defaults write com.apple.iCal "first day of week" -int 1
defaults write com.apple.iCal "number of hours displayed" -int 14

# Disk Utility - Enable debug menu
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Printer - Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Printer - Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# App Store - Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# App Store - Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# System Sound - Disable Sound Effects on Boot
# sudo nvram SystemAudioVolume=" "

# System Sound - Disable the system UI sound effects
defaults write com.apple.systemsound "com.apple.sound.beep.flash" -int 0
defaults write com.apple.systemsound "com.apple.sound.beep.volume" -int 0
defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0

# Terminal - Prevent beep
echo "set bell-style none" >> ~/.inputrc
```

## Development Tools

### Create a conf folder 

- Used for all custom config files, it prevents them from being overriden by homebrew
- If the file can't be located here (for nginx for instance) at least you'll know where to find all of them with symlink

```bash
sudo mkdir -p /usr/local/conf/nginx/{sites-enabled,sites-available,ssl}
sudo mkdir -p /var/log/{nginx,php-fpm}
sudo mkdir -p /usr/local/var/run/php-fpm
```

### Nginx

```
brew install nginx --verbose --with-debug
```

To have launchd start nginx now and restart at login:
```
brew services start nginx
```

If no nginx.conf file exists in /usr/local/conf/nginx, copy the original from /usr/local/etc/nginx/nginx.conf
- `cp /usr/local/etc/nginx/nginx.conf /usr/local/conf/nginx/nginx.conf` (optional)

Then create aliases:
```bash
ln -s /usr/local/conf/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf
ln -s /usr/local/conf/nginx/sites-available /usr/local/etc/nginx/sites-available
ln -s /usr/local/conf/nginx/sites-enabled /usr/local/etc/nginx/sites-enabled
ln -s /usr/local/conf/nginx/ssl /usr/local/etc/nginx/ssl
```

- In `/usr/local/etc/nginx/nginx.conf`:
  - Change the `user nobody;` by `user _www;`
  - Add the following line to store errors : `error_log  /var/log/nginx/error.log;`
  - The default nginx port is set to `listen 8080;` so that nginx can run without sudo. Replace it by `listen 80`.
  - Change `server_name localhost;` by `server_name 127.0.0.1;`
  - replace the default location nginx will load (`include /usr/local/etc/nginx/servers/`) by `include /usr/local/nginx/sites-enabled/*;`.
  - in the http part, add `server_tokens off;` to prevent nginx version to show up in headers
  
- Default document root is: /usr/local/var/www


Reload the config with :
```bash sudo nginx -s reload
```

Launch Nginx at login
```bash 
sudo cp -v /usr/local/opt/nginx/*.plist /Library/LaunchDaemons/
```

Then edit `/Library/LaunchDaemons/homebrew.mxcl.nginx.plist` and change the `Label` string to `nginx` which will allow us to write:
```bash
launchctl start nginx```
instead of 
```bash
launchctl start homebrew.mxcl.nginx
```

Load nginx now and automatically at reboot with :

    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

Run the following to unload the service so it will not start again at login:

    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

### PHP-FPM

We will run multiple versions of PHP: 5.6, 7.1 and 7.2.
The following is available after the mid-2018 Homebrew update.

Reinstall curl with openssl:

    brew reinstall --with-openssl curl
    
Then install PHPs

    brew install -v php@5.6

    brew install -v php@7.1
    
    brew install -v php@7.2

#### Configure php-fpm.conf and php.ini

You can found basic php-fpm config file at:

- `/usr/local/etc/php/5.6/php-fpm.conf`
- `/usr/local/etc/php/7.1/php-fpm.d/www.conf`
- `/usr/local/etc/php/7.2/php-fpm.d/www.conf`

Check especially `listen = 127.0.0.1:9000` and rename it to `unix=/usr/local/var/run/php-fpm/php72-fpm.sock`. (In each file, replace 72 by the version you're editing)

To ensure search permissions are ok, search for `;listen.mode = 0660` and change it to `listen.mode = 0666` (don't forget to remove the semi-colon).

Everything else can be left as it is.

#### Launch php now and automatically at login 

    sudo cp /usr/local/opt/php@5.6/homebrew.mxcl.php@5.6.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php@5.6.plist
    
    sudo cp /usr/local/opt/php@7.1/homebrew.mxcl.php@7.1.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php@7.1.plist
    
    sudo cp /usr/local/opt/php@7.2/homebrew.mxcl.php.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php.plist

Note: just remove -w option if you don't want it to start automatically.
You can also restart PHP with those commands without the -w option

Update your shell profile (`~/.zshrc`, `~/.bashrc` or so) file so that this branch new php is called before the system's one

    export PATH="/usr/local/bin:/usr/local/sbin:...

Source it :

    source ~/.zshrc

To solo start / stop php you can use:

    brew services start homebrew/php/php@5.6
    brew services stop homebrew/php/php@5.6

#### Switching PHP cli

You can use the custom script [phpswitcher](https://raw.githubusercontent.com/lourou/os-x-dev-clean-install/master/tools/phpswitcher)

    mkdir ~/bin
    curl -L https://raw.githubusercontent.com/gwenth/os-x-dev-clean-install/master/phpswitcher ~/bin/
    chmod u+x ~/bin/phpswitcher
    
Add ~/bin to your `$PATH` variable in you `~/.zshrc` or `~/.bashrc`

    export PATH="~/bin:..."

Source it :

    source ~/.zshrc

This script is really simple, it unlinks the current php formula and links the new one.

Usage : 
```phpswitcher 7.2``` 
will enable php7.2 cli


### Composer

```bash
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
```

### Global packages :

```composer global require "laravel/installer"```

# @todo Needs update below this point

## Development Tools

### Installing nginx

```
brew install nginx

# To have launchd start nginx now and restart at login:
brew services start nginx
```

- Default document root is: /usr/local/var/www
- The default nginx port is set in /usr/local/etc/nginx/nginx.conf to 8080 so that nginx can run without sudo.
- nginx will load all files in /usr/local/etc/nginx/servers/.
- switch nginx from port 8080 to 80 and write error logs in /var/log/nginx:

```bash
# Activate the logs
sudo mkdir /var/log/nginx
sudo mkdir /var/log/php-fpm
nano /usr/local/etc/nginx/nginx.conf

# At the top of the config file, add this:
error_log  /var/log/nginx/error.log;

# Change port from 8080 to 80
listen 80;

# Reload config
sudo nginx (or sudo nginx -s reload)

# Create these bunch of folders which we're going to use for the upcoming configuration:
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
mkdir -p /usr/local/etc/nginx/conf.d
mkdir -p /usr/local/etc/nginx/ssl

# Edit /usr/local/nginx/nginx.conf and add this line before the end of 'http' directive
include /usr/local/etc/nginx/sites-enabled/*;
```

### Launch Nginx at login

```bash 
sudo cp -v /usr/local/opt/nginx/*.plist /Library/LaunchDaemons/ && 
sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.nginx.plist &&
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
```
  
Run the following to unload the service so it will not start again at login:

```bash    
sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
```

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

You can found basic php-fpm config file here `subl /usr/local/etc/php/5.6/php-fpm.conf`.
Check especially `listen = 127.0.0.1:9000` and rename it to `listen = 127.0.0.1:9056`.
Everything else can be leave as is.

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

### Launch PHP FPM at login

- Use `nano ~/Library/LaunchAgents/org.php.php-fpm.plist` to save a PHP-FPM plist file:

```bash
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key><string>php-fpm</string>
<key>Program</key><string>/usr/local/sbin/php-fpm</string>
<key>KeepAlive</key><true/>
</dict>
</plist>
```

Run the following commands to load the services for the first time:

```bash 
launchctl load -w ~/Library/LaunchAgents/org.php.php-fpm.plist
```
  
Run the following to unload the service so it will not start again at login:

```bash    
launchctl unload -w ~/Library/LaunchAgents/org.php.php-fpm.plist
```

### Installing PHP 7.0

```
brew install -v --with-fpm \
--without-apache \
--with-mysql \
--with-homebrew-curl \
--with-homebrew-openssl \
--disable-opcache \
php7O
```

More info here:
<https://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions>

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
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist
    
Run the following to unload the service so it will not start again at login:

    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist 
    


## Mac Apps and fonts with Homebrew Cask

```bash
# Add support for fonts
brew tap caskroom/fonts

# Add dev/beta versions
brew tap caskroom/versions

#install mac apps & fonts
brew cask install \
visual-studio-code \
1password \
font-source-code-pro \
google-chrome \
firefox \
opera \
sequel-pro \
android-studio \
mactracker \
mpv \
paw \
whatsapp \
shimo \
sketch \
tripmode \
dupeguru \
imageoptim \
imagealpha \
bartender \
appdelete \
carbon-copy-cloner \
cloudapp \
colorpicker-developer \
dropbox \
evernote \
focus \
kindle \
transmit \
moom \
sourcetree \
slack \
skype \
pngyu \
omnifocus \
omnidisksweeper \
spotify \
scansnap-manager-ix100 \
androidtool \
macdown \
vlc \
vox \
calibre \
framer-x \
adobe-creative-cloud \
fontbase \
icons8

# Encfs
brew cask install osxfuse
brew install encfs

# Synology Apps
brew cask install \
synology-cloud-station-drive \
synology-photo-station-uploader
```

Some apps require manuel of App Store install:

- Adobe Creative Cloud
- Pocket
- Reeder
- SiteSucker
- ScanSnap OCR (Abbyy Fine Reader)

Music and DJ apps:

```bash
brew cask install \
ableton-live \
cycling74-max \
rekordbox \
soulseek
```

## Restore Sequel Pro Favorites

- Quit Sequel Pro if it’s running.
- Replace ~/Library/Application Support/Sequel Pro/Data/Favourites.plist with your backed up copy.
- Replace ~/Library/Preferences/com.sequelpro.SequelPro.plist with your backed up copy.

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
git config --global core.editor "vim" && \
git config --global color.ui true && \
git config --global push.default simple

#token
git config --global github.token your_token_here
```

## iOS

```bash
sudo gem install cocoapods
pod setup
```

## Dandelion Deployment Tool

```bash
brew install cmake ruby
sudo gem install net-sftp dandelion
```

## Node Packages

```bash
npm install -g coffee-script bower
npm install -g gitbook-cli
npm install -g gulp
```

If an error occurs like `Error: Node Sass does not yet support your current environment: OS X 64-bit with Unsupported runtime (57)` after gulp, just run `npm rebuild node-sass`.


## LaTeX

Download MacTeX.pkg (2.3 Go): http://www.tug.org/mactex/

Add Latex binary to PATH variable:

    export PATH="/usr/local/bin:/usr/local/sbin:/Library/TeX/texbin:/


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

#### Enable virtual hosts

This will allow you to serve folders under ~/Sites/ as websites. 

* ~/Sites
  * example.com
    * htdocs
      * index.html
  
to access this site, visit http://example.com.build


#### Match production server paths

```bash
sudo mkdir -p /var/ && sudo ln -s ~/Sites /var/www
```

## Credits

- <https://gist.github.com/saetia/1623487>
- <https://github.com/OzzyCzech/dotfiles/blob/master/how-to-install-mac.md>
- <http://www.tug.org/mactex/elcapitan.html>
- <http://www.math.univ-toulouse.fr/~mleroy/LaTeX/Install_MacOSX_mactex.pdf>
- <http://designsimply.com/2011/12/18/autostart-mysql-php-fpm-nginx-os-x-lion>
- <https://github.com/gwenth/os-x-dev-clean-install/>
