@echo off
chcp 65001 > nul

setlocal enabledelayedexpansion

cd /d %~dp0

net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Instalando MySQL-8.0.29... AGUARDE
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

rename C:\MySQL\mysql-8.0.29-winx64 MySQL-8.0.29 > nul

copy %~dp0my.ini C:\MySQL\MySQL-8.0.29\my.ini > nul

if not exist C:\MySQL\MySQL-8.0.29\uploads mkdir C:\MySQL\MySQL-8.0.29\uploads

set serviceName=MySQL80


:check_service

sc query %serviceName% > nul

IF ERRORLEVEL 1060 (
    C:\MySQL\MySQL-8.0.29\bin\mysqld --install %serviceName% --defaults-file=C:\MySQL\MySQL-8.0.29\my.ini > nul
	echo Serviço %serviceName% instalado com sucesso.

) else (
	cls
	echo Já existe um serviço nomeado %serviceName% instalado, por favor digite um nome para este novo serviço.
	set /p service_name=Nome do serviço:
	set serviceName=!service_name!
	goto check_service
)

sc config %serviceName% start=demand > nul

echo Extraindo arquivos... AGUARDE


echo @echo off > "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo chcp 65001 ^> nul >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"

echo net session ^>nul 2^>^&1 >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo   if %%errorLevel%% == 0 ( >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo net start %serviceName% >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo    ) else ( >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo echo Falha: É necessário ter permissões de administrador, execute como administrador. >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo pause >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo exit >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo ) >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"

echo cls >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"
echo C:\MySQL\MySQL-8.0.29\bin\mysql.exe -u root >> "%homedrive%%homepath%\Desktop\Iniciar %serviceName%.bat"


echo @echo off > "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo chcp 65001 ^> nul >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo net session ^>nul 2^>^&1 >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo   if %%errorLevel%% == 0 ( >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo net stop %serviceName% >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo    ) else ( >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo echo Falha: É necessário ter permissões de administrador, execute como administrador. >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo pause >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo exit >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"
echo ) >> "%homedrive%%homepath%\Desktop\Parar %serviceName%.bat"

C:\MySQL\MySQL-8.0.29\bin\mysqld --initialize-insecure

net start %serviceName% > nul

cls

C:\MySQL\MySQL-8.0.29\bin\mysql -u root

exit