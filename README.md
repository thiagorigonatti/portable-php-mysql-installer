# portable-php-mysql-installer
A script to install a PHP server with MySQL database portable

[![](https://img.shields.io/discord/677642178083946580?color=%23768ACF&label=Discord)](https://discord.gg/U8NcPcHxW3)

## This script will install httpd-2.4.63-250207-win64-VS17 (Apache), php-8.3.23-Win32-vs16-x64 (PHP), mysql-8.4.5-winx64 (MySQL Server) and phpMyAdmin-5.2.2-all-languages (Database Manager) in Windows operating system for you easy

Be sure you have installed Visual C++ Redistributable Visual Studio 2015-2022 : [vc_redist_x64](https://aka.ms/vs/17/release/VC_redist.x64.exe)

### This requires administrator permissions.

### What will the script's actions be on my machine?
1. Check if the Visual C++ Redistributable dependency is installed on the machine (generally already installed within Windows 10/11)
2. Make sure the user has administrator permissions
3. Back up the Windows hosts file to create a new one containing the note to the development hosts created by the script
4. Extract httpd-2.4.63-250207-win64-VS17.zip to C:\APMServer\Apache24\
5. Apply the settings to the Apache server
6. Extract php-8.3.23-Win32-vs16-x64.zip to C:\APMServer\PHP-8.3.23\
7. Apply settings to the PHP module
8. Install the xdebug extension for PHP
9. Extract mysql-8.4.5-winx64 to C:\APMServer\MySQL-8.4.5\
10. Apply settings to the MySQL server
11. Check for the existence of a service named MySQL84, if it already exists the script will ask to enter a new name for the MySQL service to be created
12. Extract phpMyAdmin-5.2.2-all-languages.zip to C:\APMServer\Apache24\htdocs\phpmyadmin\
13. Check the existence of a service named APMServer, if it already exists the script will ask to enter a new name for the Apache service to be created
14. Extract data from MySQL to C:\APMServer\MySQL-8.4.5
15. Start MySQL server insecurely (with no password)
16. Define the 2 installed services, MySQL84 and APMServer with manual initialization
17. Start the 2 services
18. Create 2 scripts on the Desktop to turn both services on and off
19. Create Apache monitor shortcut on the Desktop
20. Create uninstall.bat file in C:\ProgramData\APMServer to a full uninstallation
21. Open the pages for development, apmserver, phpmyadmin, mywebsite

### After being successfully installed, it is recommended to enter a password for the root user of the MySQL, do this using the following command in the SQL tab of phpmyadmin.
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'YourNewPassword'; flush privileges;
```