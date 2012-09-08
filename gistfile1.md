#Mac OS X

[Mensch coding font](http://robey.lag.net/2010/06/21/mensch-font.html)

Apps
----
[Webkit](http://webkit.org),
[Chrome](http://google.com/chrome),
[Firefox](http://firefox.com),
[iTerm](http://iterm2.com),
[Transmit](http://panic.com/transmit),
[Coda](http://panic.com/coda),
[Sublime Text](http://www.sublimetext.com/dev),
[Sequel Pro](http://nightly.sequelpro.com),
[1Password](https://agilebits.com/onepassword/mac),
[LiveReload](http://livereload.com),
[LiveReload Extensions](http://help.livereload.com/kb/general-use/browser-extensions)


#Xcode Command Line Tools

`Xcode > Preferences > Downloads > Command Line Tools`



#Shell

Switch to z-shell
---------------
```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```


#Homebrew


```bash
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
```

```bash
brew install git ack wget curl redis memcached libmemcached colordiff imagemagick icoutils
```


Update .zshrc
-------------
```bash
wget https://raw.github.com/gist/2764210/94ad3b85c8f9d61ed08d6e7f7b65e98277a07c1a/.zshrc -O ~/.zshrc
```





# OS X Preferences

```bash
#Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

#Enable repeat on keydown
defaults write -g ApplePressAndHoldEnabled -bool false

#Disable webkit homepage
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true

#Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

#Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

#Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

#Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

#Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

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

#Disable the Ping sidebar in iTunes
defaults write com.apple.iTunes disablePingSidebar -bool true

#Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Show the ~/Library folder
chflags nohidden ~/Library

#Disable ping dropdowns
defaults write com.apple.iTunes hide-ping-dropdown true

```

Set hostname
------------
`sudo scutil --set HostName Work`







#Git

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
git config --global color.ui true
```





#Coda

Install markdown support
-------------------------
```bash
git clone https://github.com/bobthecow/Markdown.mode.git ~/Library/Application\ Support/Coda\ 2/modes/Markdown.mode
```


#Sublime Text

Add Sublime Text CLI
--------------------

```bash
sudo mkdir -p "/usr/local/bin/" && ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"
```

Install Package Control
-----------------------
```python
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print 'Please restart Sublime Text to finish installation'
```

Install Soda Theme
----------------------
```bash
git clone git://github.com/buymeasoda/soda-theme.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Theme\ -\ Soda
```

Install Tomorrow Theme
----------------------
```bash
git clone git://github.com/chriskempson/textmate-tomorrow-theme.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Tomorrow
```

Settings
--------

```json
{
	"close_windows_when_empty": true,
	"color_scheme": "Packages/Color Scheme - Tomorrow/Tomorrow-Night-Eighties.tmTheme",
	"draw_indent_guides": false,
	"font_face": "Mensch",
	"font_size": 18,
	"highlight_modified_tabs": true,
	"show_tab_close_buttons": false,
	"tab_size": 2,
	"spell_check": false,
	"theme": "Soda Light.sublime-theme",
	"word_separators": "./\\()\"'-:,.;<>~!@#%^&*|+=[]{}`~?"
}

```

Key Bindings
------------

```json
[
	{ "keys": ["super+b"], "command": "expand_selection", "args": {"to": "brackets"} },
	{ "keys": ["super+f"], "command": "show_panel", "args": {"panel": "replace"} },
	{ "keys": ["super+alt+f"], "command": "show_panel", "args": {"panel": "find"} }
]
```


Snippets
--------
```bash
git clone git@github.com:bytestudios/sublime-snippets.git "/Users/Joel/Library/Application Support/Sublime Text 2/Packages/Byte"
```





















#Server

Install dnsmasq
---------------
```bash
brew install dnsmasq
```

Add DNS Domains
-----------------
```bash
mkdir -p /usr/local/etc/ &&
echo "address=/build/127.0.0.1" >> /usr/local/etc/dnsmasq.conf && 
echo "address=/stage/192.168.10.200" >> /usr/local/etc/dnsmasq.conf && 
echo "listen-address=127.0.0.1" >> /usr/local/etc/dnsmasq.conf
```

Enable dnsmasq daemon
-------------
```bash
sudo cp "/usr/local/Cellar/dnsmasq/2.57/homebrew.mxcl.dnsmasq.plist" "/Library/LaunchDaemons" &&
sudo launchctl load -w "/Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist"
```

Add Localhost to /etc/resolver
-----------------------------------
```bash
sudo -s
sudo mkdir -p /etc/resolver
sudo echo 'nameserver 127.0.0.1' > /etc/resolver/build

#flush cache
dscacheutil -flushcache

#ensure it works
scutil --dns
```


Enable virtual hosts
--------------------
```bash
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
    VirtualDocumentRoot /Users/Joel/Sites/%-2+/httpdocs
</VirtualHost>
```




```bash
#open apache config
subl "/etc/apache2/httpd.conf"
```

Configure httpd.conf
---------------------

```bash
ServerRoot "/usr"

Listen 80

LoadModule authn_file_module libexec/apache2/mod_authn_file.so
LoadModule authn_dbm_module libexec/apache2/mod_authn_dbm.so
LoadModule authn_anon_module libexec/apache2/mod_authn_anon.so
LoadModule authn_dbd_module libexec/apache2/mod_authn_dbd.so
LoadModule authn_default_module libexec/apache2/mod_authn_default.so
LoadModule authz_host_module libexec/apache2/mod_authz_host.so
LoadModule authz_groupfile_module libexec/apache2/mod_authz_groupfile.so
LoadModule authz_user_module libexec/apache2/mod_authz_user.so
LoadModule authz_dbm_module libexec/apache2/mod_authz_dbm.so
LoadModule authz_owner_module libexec/apache2/mod_authz_owner.so
LoadModule authz_default_module libexec/apache2/mod_authz_default.so
LoadModule auth_basic_module libexec/apache2/mod_auth_basic.so
LoadModule auth_digest_module libexec/apache2/mod_auth_digest.so
LoadModule cache_module libexec/apache2/mod_cache.so
LoadModule disk_cache_module libexec/apache2/mod_disk_cache.so
LoadModule mem_cache_module libexec/apache2/mod_mem_cache.so
LoadModule dbd_module libexec/apache2/mod_dbd.so
LoadModule dumpio_module libexec/apache2/mod_dumpio.so
LoadModule reqtimeout_module libexec/apache2/mod_reqtimeout.so
LoadModule ext_filter_module libexec/apache2/mod_ext_filter.so
LoadModule include_module libexec/apache2/mod_include.so
LoadModule filter_module libexec/apache2/mod_filter.so
LoadModule substitute_module libexec/apache2/mod_substitute.so
LoadModule deflate_module libexec/apache2/mod_deflate.so
LoadModule log_config_module libexec/apache2/mod_log_config.so
LoadModule log_forensic_module libexec/apache2/mod_log_forensic.so
LoadModule logio_module libexec/apache2/mod_logio.so
LoadModule env_module libexec/apache2/mod_env.so
LoadModule mime_magic_module libexec/apache2/mod_mime_magic.so
LoadModule cern_meta_module libexec/apache2/mod_cern_meta.so
LoadModule expires_module libexec/apache2/mod_expires.so
LoadModule headers_module libexec/apache2/mod_headers.so
LoadModule ident_module libexec/apache2/mod_ident.so
LoadModule usertrack_module libexec/apache2/mod_usertrack.so
#LoadModule unique_id_module libexec/apache2/mod_unique_id.so
LoadModule setenvif_module libexec/apache2/mod_setenvif.so
LoadModule version_module libexec/apache2/mod_version.so
LoadModule proxy_module libexec/apache2/mod_proxy.so
LoadModule proxy_connect_module libexec/apache2/mod_proxy_connect.so
LoadModule proxy_ftp_module libexec/apache2/mod_proxy_ftp.so
LoadModule proxy_http_module libexec/apache2/mod_proxy_http.so
LoadModule proxy_scgi_module libexec/apache2/mod_proxy_scgi.so
LoadModule proxy_ajp_module libexec/apache2/mod_proxy_ajp.so
LoadModule proxy_balancer_module libexec/apache2/mod_proxy_balancer.so
LoadModule ssl_module libexec/apache2/mod_ssl.so
LoadModule mime_module libexec/apache2/mod_mime.so
LoadModule dav_module libexec/apache2/mod_dav.so
LoadModule status_module libexec/apache2/mod_status.so
LoadModule autoindex_module libexec/apache2/mod_autoindex.so
LoadModule asis_module libexec/apache2/mod_asis.so
LoadModule info_module libexec/apache2/mod_info.so
LoadModule cgi_module libexec/apache2/mod_cgi.so
LoadModule dav_fs_module libexec/apache2/mod_dav_fs.so
LoadModule vhost_alias_module libexec/apache2/mod_vhost_alias.so
LoadModule negotiation_module libexec/apache2/mod_negotiation.so
LoadModule dir_module libexec/apache2/mod_dir.so
LoadModule imagemap_module libexec/apache2/mod_imagemap.so
LoadModule actions_module libexec/apache2/mod_actions.so
LoadModule speling_module libexec/apache2/mod_speling.so
LoadModule userdir_module libexec/apache2/mod_userdir.so
LoadModule alias_module libexec/apache2/mod_alias.so
LoadModule rewrite_module libexec/apache2/mod_rewrite.so
#LoadModule perl_module libexec/apache2/mod_perl.so
LoadModule php5_module libexec/apache2/libphp5.so
#LoadModule hfs_apple_module libexec/apache2/mod_hfs_apple.so

<IfModule !mpm_netware_module>
<IfModule !mpm_winnt_module>

User _www
Group _www

</IfModule>
</IfModule>

ServerAdmin saetia@gmail.com

ServerName localhost

DocumentRoot "/Library/WebServer/Documents"

<Directory />
    Options FollowSymLinks
    AllowOverride None
    Order deny,allow
    Deny from all
</Directory>

<Directory "/Library/WebServer/Documents">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    Allow from all
</Directory>

<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>

<FilesMatch "^\.([Hh][Tt]|[Dd][Ss]_[Ss])">
    Order allow,deny
    Deny from all
    Satisfy All
</FilesMatch>

<Files "rsrc">
    Order allow,deny
    Deny from all
    Satisfy All
</Files>

<DirectoryMatch ".*\.\.namedfork">
    Order allow,deny
    Deny from all
    Satisfy All
</DirectoryMatch>

ErrorLog "/private/var/log/apache2/error_log"

LogLevel warn

<IfModule log_config_module>

    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %b" common

    <IfModule logio_module>
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
    </IfModule>

    CustomLog "/private/var/log/apache2/access_log" common

</IfModule>

<IfModule alias_module>
    ScriptAliasMatch ^/cgi-bin/((?!(?i:webobjects)).*$) "/Library/WebServer/CGI-Executables/$1"
</IfModule>

<IfModule cgid_module>
</IfModule>

<Directory "/Library/WebServer/CGI-Executables">
    AllowOverride None
    Options None
    Order allow,deny
    Allow from all
</Directory>

DefaultType text/plain

<IfModule mime_module>

    TypesConfig /private/etc/apache2/mime.types

    AddType application/x-compress .Z
    AddType application/x-gzip .gz .tgz

</IfModule>

TraceEnable off

Include /private/etc/apache2/extra/httpd-mpm.conf
Include /private/etc/apache2/extra/httpd-autoindex.conf
Include /private/etc/apache2/extra/httpd-languages.conf
Include /private/etc/apache2/extra/httpd-userdir.conf
Include /private/etc/apache2/extra/httpd-manual.conf

<IfModule ssl_module>
    SSLRandomSeed startup builtin
    SSLRandomSeed connect builtin
</IfModule>

<IfModule php5_module>
    AddType application/x-httpd-php .php
    AddType application/x-httpd-php-source .phps
    <IfModule dir_module>
        DirectoryIndex index.html index.php
    </IfModule>
</IfModule>

Include /private/etc/apache2/other/*.conf
```

Enable centOS style /var/www/vhosts
-----------------------------------

```bash
sudo mkdir -p /var/www/ &&
sudo ln -s ~/Sites /var/www/vhosts
```





XDebug
------


```bash
brew install https://github.com/josegonzalez/homebrew-php/raw/master/Formula/xdebug-php.rb
```

MySQL
-----

```bash
brew install mysql
```

MySQL Settings
--------------




```bash

#setup daemon
mkdir -p ~/Library/LaunchAgents && cp /usr/local/Cellar/mysql/5.5.20/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/ && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist


#Set up databases to run as your user account
unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

#start mysql
mysql.server start

#secure mysql
/usr/local/Cellar/mysql/5.5.20/bin/mysql_secure_installation
```



Configure php.ini
---------------------

```bash
#create php.ini
sudo touch /etc/php.ini && subl /etc/php.ini
```

```ini
[PHP]

engine = On
short_open_tag = On
asp_tags = Off
precision = 14
y2k_compliance = On
output_buffering = 4096
;output_handler =
zlib.output_compression = On
zlib.output_compression_level = -1
zlib.output_handler =
implicit_flush = Off
unserialize_callback_func =
serialize_precision = 17
allow_call_time_pass_reference = Off
safe_mode = Off
safe_mode_gid = Off
safe_mode_include_dir =
safe_mode_exec_dir =
safe_mode_allowed_env_vars = PHP_
safe_mode_protected_env_vars = LD_LIBRARY_PATH
disable_functions =
disable_classes =
expose_php = On
max_execution_time = 30
max_input_time = 60
memory_limit = 128M
error_reporting = E_ALL | E_STRICT
display_errors = On
display_startup_errors = Off
log_errors = On
log_errors_max_len = 1024
ignore_repeated_errors = Off
ignore_repeated_source = Off
report_memleaks = On
track_errors = Off
html_errors = On
;error_prepend_string = "<span style='color: #ff0000'>"
;error_append_string = "</span>"
;error_log = php_errors.log
;error_log = syslog
variables_order = "GPCS"
request_order = "GP"
register_globals = Off
register_long_arrays = Off
register_argc_argv = Off
auto_globals_jit = On
post_max_size = 8M
magic_quotes_gpc = Off
magic_quotes_runtime = Off
magic_quotes_sybase = Off
auto_prepend_file =
auto_append_file =
default_mimetype = "text/html"
default_charset = "utf-8"
include_path = ".:/usr/lib/php/pear"
doc_root =
user_dir =
extension_dir = "/usr/lib/php/extensions/no-debug-non-zts-20090626"
enable_dl = Off
file_uploads = On
upload_max_filesize = 2M
max_file_uploads = 20
allow_url_fopen = On
allow_url_include = Off
default_socket_timeout = 60
zend_extension="/usr/local/Cellar/xdebug-php/2.1.3/xdebug.so"

[Date]

date.timezone = "UTC"

[filter]

[iconv]

[intl]

[sqlite]

[sqlite3]

[Pcre]

[Pdo]

[Pdo_mysql]

pdo_mysql.cache_size = 2000
pdo_mysql.default_socket=/var/mysql/mysql.sock

[Phar]

[Syslog]

define_syslog_variables  = Off

[mail function]

SMTP = localhost
smtp_port = 25
mail.add_x_header = On

[SQL]

sql.safe_mode = Off

[ODBC]

odbc.allow_persistent = On
odbc.check_persistent = On
odbc.max_persistent = -1
odbc.max_links = -1
odbc.defaultlrl = 4096
odbc.defaultbinmode = 1

[Interbase]

ibase.allow_persistent = 1
ibase.max_persistent = -1
ibase.max_links = -1
ibase.timestampformat = "%Y-%m-%d %H:%M:%S"
ibase.dateformat = "%Y-%m-%d"
ibase.timeformat = "%H:%M:%S"

[MySQL]

mysql.allow_local_infile = On
mysql.allow_persistent = On
mysql.cache_size = 2000
mysql.max_persistent = -1
mysql.max_links = -1
mysql.default_port = 3306
mysql.default_socket = /var/mysql/mysql.sock
mysql.default_host =
mysql.default_user =
mysql.default_password =
mysql.connect_timeout = 60
mysql.trace_mode = Off

[MySQLi]

mysqli.max_persistent = -1
mysqli.allow_persistent = On
mysqli.max_links = -1
mysqli.cache_size = 2000
mysqli.default_port = 3306
mysqli.default_socket = /var/mysql/mysql.sock
mysqli.default_host =
mysqli.default_user =
mysqli.default_pw =
mysqli.reconnect = Off

[mysqlnd]

mysqlnd.collect_statistics = On
mysqlnd.collect_memory_statistics = Off

[OCI8]

[PostgresSQL]

pgsql.allow_persistent = On
pgsql.auto_reset_persistent = Off
pgsql.max_persistent = -1
pgsql.max_links = -1
pgsql.ignore_notice = 0
pgsql.log_notice = 0

[Sybase-CT]

sybct.allow_persistent = On
sybct.max_persistent = -1
sybct.max_links = -1
sybct.min_server_severity = 10
sybct.min_client_severity = 10

[bcmath]

bcmath.scale = 0

[browscap]

[Session]

session.save_handler = files
session.use_cookies = 1
session.use_only_cookies = 1
session.name = PHPSESSID
session.auto_start = 0
session.cookie_lifetime = 0
session.cookie_path = /
session.cookie_domain =
session.cookie_httponly =
session.serialize_handler = php
session.gc_probability = 1
session.gc_divisor = 1000
session.gc_maxlifetime = 1440
session.bug_compat_42 = Off
session.bug_compat_warn = Off
session.referer_check =
session.entropy_length = 0
session.cache_limiter = nocache
session.cache_expire = 180
session.use_trans_sid = 0
session.hash_function = 0
session.hash_bits_per_character = 5
url_rewriter.tags = "a=href,area=href,frame=src,input=src,form=fakeentry"

[MSSQL]

mssql.allow_persistent = On
mssql.max_persistent = -1
mssql.max_links = -1
mssql.min_error_severity = 10
mssql.min_message_severity = 10
mssql.compatability_mode = Off
mssql.secure_connection = Off

[Assertion]

[COM]

[mbstring]

[gd]

[exif]

[Tidy]

tidy.clean_output = Off

[soap]

soap.wsdl_cache_enabled=1
soap.wsdl_cache_dir="/tmp"
soap.wsdl_cache_ttl=86400
soap.wsdl_cache_limit = 5

[sysvshm]

[ldap]

ldap.max_links = -1

[mcrypt]

[dba]

[xdebug]
xdebug.idekey="macgdbp"
xdebug.remote_enable=1 
xdebug.remote_handler=dbgp 
xdebug.remote_mode=req 
xdebug.remote_host=127.0.0.1 
xdebug.remote_port=9000 
xdebug.profiler_append=1 
xdebug.profiler_enable=1
xdebug.profiler_enable_trigger=1 
xdebug.profiler_output_name = cachegrind.out.%s 
xdebug.profiler_output_dir=/tmp/
```


Restart apache
--------------
```bash
sudo apachectl graceful
```



PHPUnit
-------

```bash
cd /usr/lib/php &&
sudo php install-pear-nozlib.phar &&
sudo pear channel-update pear.php.net &&
sudo pecl channel-update pecl.php.net &&
sudo pear upgrade-all &&
sudo pear channel-discover pear.phpunit.de  &&
sudo pear channel-discover components.ez.no &&
sudo pear channel-discover pear.symfony-project.com &&
sudo pear install phpunit/PHPUnit &&
sudo pear install phpunit/phpcpd &&
sudo pear install PHP_CodeSniffer
```

Guard
-----

```bash
gem install growl guard guard-phpunit
```




![aww yeah](http://i.imgur.com/AmFax.gif)