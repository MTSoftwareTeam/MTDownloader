@echo off
title MTDownloader - Settings
if "%first_run%"=="1" (
    echo Welcome in MTDownloader!
    echo We are preparing you for the launch of the program.
    echo Settings will be saved in the "config" catalog.
    pause
    goto setup
)

:menu
echo Choose option:
echo 1. Change settings
echo 2. Display current configuration
echo 3. Go back to the main menu
set /p choice=Your choice:
if "%choice%"=="1" (
    goto setup
) else if "%choice%"=="2" (
    cls
    echo Current configuration:
    echo Close after download: %close_after_download%
    echo Check updates: %check_updates%
    echo Theme: %theme%
    echo Cookies: %cookies%
    echo Resolution: %resolution%
    pause
    goto menu
) else if "%choice%"=="3" (
    echo Restart app to apply changes.
    pause
    exit /b 
) else (
    echo Incorrect choice, try again.
    goto menu
)




:setup
echo I'll ask a few questions to set up the program.
echo Should the program close after downloading the file? (Y/N)
set /p close_after_download=Choice:
if /i "%close_after_download%"=="Y" (
    set close_after_download=1
) else (
    set close_after_download=0
)
echo %close_after_download% > config\close_after_download.config
echo Should the program check for updates? (Y/N)
set /p check_updates=Choice:
if /i "%check_updates%"=="Y" (
    set check_updates=1
) else (
    set check_updates=0
)
echo %check_updates% > config\check_updates.config
echo Choose the theme.
echo 1. Light
echo 2. Dark
echo 3. Blue (default)
echo 4. Green 
echo 5. Red
set /p theme_choice=Wybór:
if "%theme_choice%"=="1" (
    set theme=light
) else if "%theme_choice%"=="2" (
    set theme=dark
) else if "%theme_choice%"=="3" (
    set theme=blue
) else if "%theme_choice%"=="4" (
    set theme=green
) else if "%theme_choice%"=="5" (
    set theme=red
) else (
    echo Incorrect choice, I'm setting the theme to Blue.
    set theme=blue
)
echo %theme% > config\theme.config
echo Provide your cookies file!
echo If you don't have cookies file, leave this blank.
set /p cookies=Cookies file (provide file destination), drag'n'drop works:
if not exist "%cookies%" (
    echo Cookies file doesn't exist, I won't use them.
    set cookies=0
    echo %cookies% > config\cookies.config
) else (
    echo 1 > config\cookies.config
    copy "%cookies%" config\cookies.txt >nul 2>&1
    echo Cookies file was applied.
)
echo Choose the resolution you want your videos to be downloaded (1-8):
echo 1. Best available one
echo 2. 1440p
echo 3. 1080p
echo 4. 720p
echo 5. 480p
echo 6. 360p
echo 7. 240p
echo 8. 144p
set /p resolution=Resolution: 
if "%resolution%"=="1" (
    set resolution=best
) else if "%resolution%"=="2" (
    set resolution=1440
) else if "%resolution%"=="3" (
    set resolution=1080
) else if "%resolution%"=="4" (
    set resolution=720
) else if "%resolution%"=="5" (
    set resolution=480
) else if "%resolution%"=="6" (
    set resolution=360
) else if "%resolution%"=="7" (
    set resolution=240
) else if "%resolution%"=="8" (
    set resolution=144
) else (
    echo Incorrect choice, I'm setting the 1080p resolution.
    set resolution=1080
)
echo %resolution% > config\resolution.config
echo Changes were saved. They will be applied after restart.
pause
start MTDownloader.exe
exit
