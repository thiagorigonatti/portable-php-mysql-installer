# portable-mysql-installer-script
A script to install MySQL server portable

## This script will install MySQL8.0.29 in Windows operating system for you easy

Make sure to download https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.29-winx64.zip from the oficial website
and make sure to have downloaded `ini.my` file also

### This requires administrator permissions

Once running the script will:
1. Check for administrator permissions
2. Extract mysql-8.0.29-winx64.zip to C:\MySQL\
3. Copy my.ini file to C:\MySQL\MySQL-8.0.29\
4. Create uploads folder according to my.ini option
5. Try to create a service named `MySQL80` if it already exists the script will prompt you to enter a name to a new service
6. Config this service as manual initialization
7. Create 2 files named start MySQL80.bat and stop MySQL80.bat to start and open MySQL80 later
8. Initialize MySQL data folder insecure (with no pass for root user)
9. Open MySQL in command prompt to be used

Then you can change your root password by typing this on MySQL server

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'YourNewPassword';
flush privileges;
exit;
```

Note: If you put a password for root you need to change start MySQL80.bat file as the following:

`C:\MySQL\MySQL-8.0.29\bin\mysql.exe -u root`
to
`C:\MySQL\MySQL-8.0.29\bin\mysql.exe -u root -p YourNewPassword`
