@echo off


setlocal enabledelayedexpansion
cd /d %~dp0

net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Instalando MySQL8.0 - Script criado por: Thiago Rigonatti.
    ) else (
        echo Falha: É necessário ter permissões de administrador, execute como administrador.
		pause
		exit
    )

Call :UnZipFile "C:\MySQL\" "%~dp0mysql-8.0.29-winx64.zip"


:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%

rename "C:\MySQL\mysql-8.0.29-winx64" "MySQL-8.0.29"

copy %~dp0my.ini C:\MySQL\MySQL-8.0.29\my.ini

if not exist C:\MySQL\MySQL-8.0.29\uploads mkdir C:\MySQL\MySQL-8.0.29\uploads

setlocal enabledelayedexpansion
set serviceName=MySQL80

sc query %serviceName%
cls

echo Instalando MySQL8.0 - Script criado por: Thiago Rigonatti.

IF ERRORLEVEL 1060 (
    C:\MySQL\MySQL-8.0.29\bin\mysqld.exe --install %serviceName% --defaults-file=C:\MySQL\MySQL-8.0.29\my.ini
) else (
	echo "Já existe um serviço nomeado %serviceName% instalado, por favor digite um nome para este novo serviço."
	set /p service_name=Nome do serviço: 
	set serviceName=!service_name!
	C:\MySQL\MySQL-8.0.29\bin\mysqld.exe --install !service_name! --defaults-file=C:\MySQL\MySQL-8.0.29\my.ini
)

sc config %serviceName% start=demand

echo Extraindo data...

echo net start %serviceName% > "%homedrive%%homepath%\Desktop\iniciar %serviceName%.bat"
echo C:\MySQL\MySQL-8.0.29\bin\mysql.exe -u root >> "%homedrive%%homepath%\Desktop\iniciar %serviceName%.bat"

echo net stop %serviceName% > "%homedrive%%homepath%\Desktop\parar %serviceName%.bat"

C:\MySQL\MySQL-8.0.29\bin\mysqld --initialize-insecure

net start %serviceName%

exit