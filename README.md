# portable-php-mysql-installer
A script to install a PHP server with MySQL database portable

[![](https://img.shields.io/discord/677642178083946580?color=%23768ACF&label=Discord)](https://discord.gg/U8NcPcHxW3)

## This script will install httpd-2.4.56-win64-VS17 (Apache), php-8.2.3-Win32-vs16-x64 (PHP), mysql-8.0.32-winx64 (MySQL Server) and phpMyAdmin-5.2.1-all-languages (Database Manager) in Windows operating system for you easy

Be sure you have installed latest 14.32.31332 Visual C++ Redistributable Visual Studio 2015-2022 : [vc_redist_x64](https://aka.ms/vs/17/release/VC_redist.x64.exe)

Make sure to download these 4 zipped files from the oficial websites here:

[httpd-2.4.56-win64-VS17.zip](https://www.apachelounge.com/download/VS17/binaries/httpd-2.4.56-win64-VS17.zip)

[php-8.2.3-Win32-vs16-x64.zip](https://windows.php.net/downloads/releases/php-8.2.3-Win32-vs16-x64.zip)

[mysql-8.0.32-winx64.zip](https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.32-winx64.zip)

[phpMyAdmin-5.2.1-all-languages.zip](https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip)


### This requires administrator permissions

Once running, the script will:
1. Check for administrator permissions
2. Create hosts file backup and create a new hosts file with 3 new domains
3. Extract httpd-2.4.56-win64-VS17.zip to C:\APMServer\ (en) or C:\ServidorAPM\ (pt_BR)
4. Apply the configuration for apache server
5. Extract php-8.2.3-Win32-vs16-x64.zip to C:\APMServer\PHP-8.2.3\ (en) or C:\ServidorAPM\PHP-8.2.3 (pt_BR)
6. Apply the configuration for PHP module
7. Extract mysql-8.0.32-winx64.zip to C:\APMServer\MySQL-8.0.32\ (en) or C:\ServidorAPM\MySQL-8.0.32 (pt_BR)
8. Apply the configuration for MySQL8.0 database
9. Check if there is a service named `MySQL80` already installed, if so, you'll be prompted to enter a new name for this service to be installed
10. Extract phpMyAdmin-5.2.1-all-languages.zip to C:\APMServer\Apache24\htdocs\phpmyadmin\ (en) or C:\ServidorAPM\Apache24\htdocs\phpmyadmin (pt_BR)
11. Check if there is a service named `APMServer` already installed, if so, you'll be prompted to enter a new name for this service to be installed
12. Extract data for MySQL and initialize it insecurely
13. Set those 2 services `MySQL80` and `APMServer` as manually started
14. Start the services
15. Create 2 scripts on desktop to start and stop APMServer (the services)
16. Create a shortcut on desktop for ApacheMonitor.exe
17. Open MySQL in command prompt to be used

Then you can change your root password by typing this on MySQL server

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'NewPassword';
flush privileges;
exit;
```

Note: If you put a password for root you need to change `Start APMServer.bat` file as the following:

`"C:\APMServer\MySQL-8.0.32\bin\mysql.exe" -u root`
to
`"C:\APMServer\MySQL-8.0.32\bin\mysql.exe" -u root -p`
