@echo off & "%__APPDIR__%chcp.com" 65001 >nul
set version=1.1.0
title Chat
set theme=2
set notif=2
echo %notif% > notif_%username%.tmp
set notif_=0
:start
cls
set /a message_send=0  
set "dat_e=%date:/=_%"
call :download

echo                                                      ╔════════════╗
echo                                                      ║   pseudo   ║
echo                                                      ╚════════════╝
echo.
set /p pseudo=pseudo ~ 
if %pseudo%==settings goto :settings
echo [%time:~0,2%h%time:~3,2%] %pseudo% Joined the Chat!>>".\Chat\%dat_e%.txt"
echo .>___NC___.NC
title Chat [user:%pseudo%]

:chat
cls
echo pseudo: %pseudo%
echo last message sent : %time:~0,2%h%time:~3,2%
echo message send: %message_send%
echo.
echo.
echo type settings to open settings
echo.
set /p new_chat=Chat ~ 
if %new_chat%==settings goto :settings
echo [%time:~0,2%h%time:~3,2%] %pseudo%: %new_chat%>>".\Chat\%dat_e%.txt"
echo .>___NC___.NC
set /a message_send=message_send +1
title Chat [user: %pseudo%]  [last mess sent: %time:~0,2%h%time:~3,2%]  [mess send: %message_send%]
goto :chat

:settings
cls
echo                                                     ╔══════════════╗
echo                                                     ║   settings   ║
echo                                                     ╚══════════════╝
echo.
echo                                               [1] back [2] theme [3] notif
set /p settings=settings ~ 
if %settings%==1 goto :chat
if %settings%==2 goto :theme
if %settings%==3 goto :notif
goto :settings

:theme
cls
echo                                                      ╔═══════════╗
echo                                                      ║   Theme   ║
echo                                                      ╚═══════════╝
echo.
echo                                              [1] back [2] default [3] dark
echo                                               [4] light [5] fire [6] blue
if %theme%==2 echo actif: default
if %theme%==3 echo actif: dark
if %theme%==4 echo actif: light
if %theme%==5 echo actif: fire
if %theme%==6 echo actif: blue
set /p theme=theme ~ 
if %theme%==1 goto :chat
if %theme%==2 color 07
if %theme%==3 color 08
if %theme%==4 color F0
if %theme%==5 color 4E
if %theme%==6 color B4
goto :theme

:notif
cls
echo                                                  ╔═══════════════════╗
echo                                                  ║   notifications   ║
echo                                                  ╚═══════════════════╝
echo.
echo                                               [1] back [2] true [3] false
if %notif%==2 (echo notifications: True) else if %notif_%==2 echo notifications: True
if %notif%==3 (echo notifications: False) else if %notif_%==3 echo notifications: False
set /p notif=notifications ~ 
if %notif%==1 goto :chat 
if %notif%==2 set notif_=%notif% & echo %notif% > notif_%username%.tmp
if %notif%==3 set notif_=%notif% & echo %notif% > notif_%username%.tmp
goto :notif


:download
if not exist ".\Chat" md ".\Chat"
if not exist ".\Chat\%dat_e%.txt" echo %date% new chat!>>".\Chat\%dat_e%.txt"
goto :fin

:fin