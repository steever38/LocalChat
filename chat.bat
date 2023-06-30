@echo off & "%__APPDIR__%chcp.com" 65001 >nul
title Chat
set "dat_e=%date:/=_%"*
call :download
goto :start

:reload
cls
echo notif=%notif%
if "%notif%"=="2 " start /min notif.vbs
:start
type ".\Chat\%dat_e%.txt"
echo.
echo Time: %time:~0,2%h%time:~3,2%

:boucle
if exist "notif_%username%.tmp" set /p notif=<notif_%username%.tmp & del "notif_%username%.tmp"
if exist "___NC___.NC" del "___NC___.NC" & goto :reload

setlocal enabledelayedexpansion
set "file=.\Chat\%dat_e%.txt"
set /a count=0

for /f %%a in ('type "%file%" ^| find /v /c ""') do set /a count=%%a

if !count! gtr 500 (
    more +1 "%file%" > "%file%.tmp"
    move /y "%file%.tmp" "%file%" >nul
)
endlocal

goto :boucle

:download
if not exist ".\Chat" md ".\Chat"
if not exist ".\Chat\%dat_e%.txt" echo %date% new chat!>>".\Chat\%dat_e%.txt"
goto :fin

:fin