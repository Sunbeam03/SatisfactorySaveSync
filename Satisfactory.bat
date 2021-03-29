@echo off
setlocal EnableDelayedExpansion
set gamedir=""
if exist gamelocation.txt (
	set /p gamedir=<gamelocation.txt
	echo Game Directory Found: !gamedir!
	goto :starting
)
echo Finding your game directory. Please wait...
set test=""
set exeName="FactoryGame.exe"
for %%D in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\" (
    	FOR /F %%a in ('WHERE /F /R %%D:\ FactoryGame.exe 2^>nul') do (
    		SET gamedir=%%a
    		SET test="!gamedir:FactoryGame.exe=!"
    		if not "!gamedir!" == "!test!" (
    			echo !gamedir! > gamelocation.txt
    			goto :starting
    		)
    	)
     )
) > NUL
echo No game directory found. Closing...
TIMEOUT 10
goto :eof

:starting
@echo on
echo Found game directory:!gamedir!
start "Satisfactory" !gamedir!
watch.cmd