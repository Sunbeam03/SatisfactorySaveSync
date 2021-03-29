COPY /Y %~1 .\
REM Add a set and copy for each player ID
set player1Saves=Saved\SaveGames\76561197966141175
COPY /Y %~nx1 %player1Saves%
DEL /q /f .\*.sav

@setlocal enableextensions enabledelayedexpansion
@echo off
set filename=%~nx1
set savefiles=*.sav
set directory=%~dp1
set allsaves=%directory%%savefiles%
REM ADD AN IF..COPY in case you use the Experimental Branch
if not x%filename:_BAK=%==x%filename% COPY /Y %allsaves% %player1Saves%
endlocal

SET message=MP-Autosave-%~nx1
git add -A
git commit -a -m %message%
git push