# portable-php-mysql-installer
A script to install a PHP server with MySQL database portable

[![](https://img.shields.io/discord/677642178083946580?color=%23768ACF&label=Discord)](https://discord.gg/U8NcPcHxW3) [![Twitch Status](https://img.shields.io/twitch/status/thiagorigonatti?label=Twitch)](https://twitch.tv/thiagorigonatti)
[![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCEDjQf5cEkH4320GevAitUA?label=Thiago%20Rigonatti)](https://www.youtube.com/thiagorigonatti)

## This script will install httpd-2.4.54-win64-VS16 (Apache), php-8.1.8-Win32-vs16-x64 (PHP), mysql-8.0.30-winx64 (MySQL Server) and phpMyAdmin-5.2.0-all-languages (Database Manager) in Windows operating system for you easy

Be sure you installed latest 14.32.31332 Visual C++ Redistributable Visual Studio 2015-2022 : [vc_redist_x64](https://aka.ms/vs/17/release/VC_redist.x64.exe)

Make sure to download these 4 zipped files from the oficial websites here:

[httpd-2.4.54-win64-VS16.zip](https://www.apachelounge.com/download/VS16/binaries/httpd-2.4.54-win64-VS16.zip)

[php-8.1.8-Win32-vs16-x64.zip](https://windows.php.net/downloads/releases/archives/php-8.1.8-Win32-vs16-x64.zip)

[mysql-8.0.30-winx64.zip](https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.30-winx64.zip)

[phpMyAdmin-5.2.0-all-languages.zip](https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip)


### This requires administrator permissions

Once running, the script will:
1. Check for administrator permissions
2. Extract httpd-2.4.54-win64-VS16.zip to C:\APMServer\ (en) or C:\ServidorAPM\ (pt_BR)
3. Apply the configuration for apache server
4. Extract php-8.1.8-Win32-vs16-x64.zip to C:\APMServer\PHP-8.1.8\ (en) or C:\ServidorAPM\PHP-8.1.8 (pt_BR)
5. Apply the configuration for PHP module
6. Extract mysql-8.0.30-winx64.zip to C:\APMServer\MySQL-8.0.30\ (en) or C:\ServidorAPM\MySQL-8.0.30 (pt_BR)
7. Apply the configuration for MySQL8.0 database
8. Check if there is a service named `MySQL80` already installed, if so, you'll be prompted to enter a new name for this service to be installed
9. Extract phpMyAdmin-5.2.0-all-languages.zip to C:\APMServer\Apache24\htdocs\phpmyadmin\ (en) or C:\ServidorAPM\Apache24\htdocs\phpmyadmin (pt_BR)
10. Check if there is a service named `APMServer` already installed, if so, you'll be prompted to enter a new name for this service to be installed
11. Extract data for MySQL and initialize it insecurely
12. Set those 2 services `MySQL80` and `APMServer` as manually started
13. Start the services
14. Create 2 scripts on desktop to start and stop APMServer (the services)
15. Create a shortcut on desktop for ApacheMonitor.exe
16. Open MySQL in command prompt to be used

Then you can change your root password by typing this on MySQL server

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'YourNewPassword';
flush privileges;
exit;
```

Note: If you put a password for root you need to change `Start APMServer.bat` file as the following:

`"C:\APMServer\MySQL-8.0.30\bin\mysql.exe" -u root`
to
`"C:\APMServer\MySQL-8.0.30\bin\mysql.exe" -u root -p`
