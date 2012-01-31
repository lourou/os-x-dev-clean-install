#Mac OS X

[Mensch coding font](http://robey.lag.net/2010/06/21/mensch-font.html)

Apps
----
* [Webkit](http://webkit.org)
* [Chrome](http://google.com/chrome)
* [Firefox](http://firefox.com)
* [iTerm](http://iterm2.com)
* [Transmit](http://panic.com/transmit)
* [Coda](http://panic.com/coda)
* [Sublime Text](http://www.sublimetext.com/dev)
* [Sequel Pro](http://nightly.sequelpro.com)
* [1Password](https://agilebits.com/onepassword/mac)
* [LiveReload](http://livereload.com)
* [LiveReload Extensions](http://help.livereload.com/kb/general-use/browser-extensions)

```bash
#Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

#Enable key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

#Disable webkit homepage
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true
```

Set hostname
------------
`sudo scutil --set HostName Work`





#Sublime Text

Add Sublime Text CLI
--------------------

```bash
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"
```

Install Package Control
-----------------------
```python
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print 'Please restart Sublime Text to finish installation'
```

Install Tomorrow Theme
----------------------
```bash
git clone git://github.com/ChrisKempson/TextMate-Tomorrow-Theme.git "~/Library/Application Support/Sublime Text 2/Packages/Color Scheme - Tomorrow"
```

File Settings
-------------

```json
{
	"color_scheme": "Packages/Color Scheme - Tomorrow/Tomorrow-Night-Eighties.tmTheme",
	"draw_indent_guides": false,
	"font_face": "Mensch",
	"font_size": 16,
	"spell_check": false,
	"word_separators": "./\\()\"'-:,.;<>~!@#%^&*|+=[]{}`~?"
}
```

Global Settings
-------------

```json
{
	"theme": "Soda Light.sublime-theme",
	"show_tab_close_buttons": false,
	"highlight_modified_tabs": true,
	"close_windows_when_empty": true
}
```

Keymap Settings

```json
[
	{ "keys": ["super+b"], "command": "expand_selection", "args": {"to": "brackets"} }
]
```


Snippets
--------
```bash
git clone git@github.com:bytestudios/sublime-snippets.git "/Users/Joel/Library/Application Support/Sublime Text 2/Packages/Byte"
```




#Homebrew

```bash
brew install git ack wget curl redis memcached libmemcached colordiff imagemagick
```



#Shell

Install z-shell
---------------
```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

Update .zshrc
-------------
```bash
subl ~/.zshrc
```
`ZSH_THEME="robbyrussell"` ➔ `ZSH_THEME="kphoen"`

`plugins=(git)` ➔
`plugins=(git osx rails ruby github node npm brew)`



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
sudo cp "/usr/local/Cellar/dnsmasq/2.57/uk.org.thekelleys.dnsmasq.plist" "/Library/LaunchDaemons" &&
sudo launchctl load -w "/Library/LaunchDaemons/uk.org.thekelleys.dnsmasq.plist"
```

Add Localhost to /etc/resolver
-----------------------------------
```bash

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


Open apache config and replace lines

```bash
subl "/etc/apache2/httpd.conf"
```

`#LoadModule php5_module libexec/apache2/libphp5.so` ➔ `LoadModule php5_module /usr/local/Cellar/php/5.3.8/libexec/apache2/libphp5.so`

`DirectoryIndex index.html` ➔ `DirectoryIndex index.html index.php`

Enable centOS style /var/www/vhosts
-----------------------------------

```bash
sudo mkdir -p /var/www/ &&
sudo ln -s ~/Sites /var/www/vhosts
```


XDebug
------

```bash
brew install xdebug
```

MySQL
-----

```bash
brew install https://raw.github.com/saetia/homebrew/php/Library/Formula/php.rb --with-apache --with-mysql --with-pgsql
```

MySQL Settings
--------------

```bash
#Set up databases to run as your user account
unset TMPDIR &&
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp &&
cp $(brew --prefix mysql)/support-files/my-small.cnf /usr/local/var/mysql/my.cnf &&
sed -i "" 's/max_allowed_packet = 1.*M/max_allowed_packet = 2G/g' /usr/local/var/mysql/my.cnf &&
mkdir -p ~/Library/LaunchAgents &&
cp /usr/local/Cellar/mysql/5.5.20/com.mysql.mysqld.plist ~/Library/LaunchAgents/ &&
launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist

#start mysql
mysql.server start

#change password
/usr/local/Cellar/mysql/5.5.20/bin/mysqladmin -u root password 'new-password'
```



Configure php.ini
---------------------

```bash
subl "/usr/local/Cellar/php/5.3.8/etc/php.ini"
```

```ini
[PHP]

engine = On
short_open_tag = On
asp_tags = On
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
zend_extension="/usr/local/Cellar/xdebug/2.1.2/xdebug.so"

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


![aww yeah](http://i0.kym-cdn.com/photos/images/newsfeed/000/106/887/backpain-1292835351.jpg)