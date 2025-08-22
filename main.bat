::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCmLNGSuUYk47fvw++WXnmApcO0odoPU27CLMq0e60zqSZoi0XUUjNMYbA==
::fBE1pAF6MU+EWHreyHcjLQlHcCmLNGSuUYk47fvw++WXnmApcO0odoPU27CLMq0e60zqSZoi0XUXld9CGANMHg==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDZdRAuWa1eeA6YX/Ofr08ezhkIKWu4weYveyPmDIekd1mHrYpgh2XtendlCBRhXMBuoYW8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJmZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsCAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIdHD9bWwqOM2q+A6dKiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDCm2GGStCLkT6ez+/aSCukh9
::fBEirQZwNQPfEVWB+kM9LVsJDCm2GGStCLkT6ez+/byG7EgFUYI=
::cRolqwZ3JBvQF1fEqQIUKQlZQxObfHuoCbIO6eW76+XHskIfXecteYHS29Q=
::dhA7uBVwLU+EWHSwx002PAxVXgHi
::YQ03rBFzNR3SWATE1lAxI3s=
::dhAmsQZ3MwfNWATE2Us4Jw8DDCm2D2S8EqId+u27vbrV9y0=
::ZQ0/vhVqMQ3MEVWAtB9wGh5VQAWROSuZB7sY4ez6++/H8S0=
::Zg8zqx1/OA3MEVWAtB9wHBpfLA==
::dhA7pRFwIByZRRmm5kM7SA==
::Zh4grVQjdCyDJGyX8VAjFDZdRAuWa1eeA6YX/Ofr08ezhkIKWu4weYveyPmDIekd1mjQUZk62HZVmc8JHlVdZhfL
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983

rem Production cycle:
rem 1. Alpha - Development version, adds new features, may contain bugs.
rem 2. Beta - Version for testing purposes, fixes bugs, may still add some features.
rem 3. Release Candidate - Final testing version, no new features, only bug fixes.
rem 4. Stable - Final version, no bugs, no new features, only security updates.
@echo off
set date-rel=15.08.2025
@chcp 65001>nul
cd /d "%LocalAppData%\MTDownloader"
cls
set build=Release Candidate 3
title MTDownloader %ver% %build%
set ver=6.0
cls
color 09
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD
echo Checking the completeness of the program...
REM --- Check yt-dlp.exe ---
if not exist "%LocalAppData%\MTDownloader\yt-dlp.exe" (
    color 0C
    echo [ERROR] yt-dlp.exe not found in %LocalAppData%\MTDownloader!
    echo Reinstall app to fix this issue.
    pause
    exit
)
"%LocalAppData%\MTDownloader\yt-dlp.exe" --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo [ERROR] yt-dlp.exe is not working properly!
    echo Try to install yt-dlp once again.
    pause
    exit
)

REM --- Check aria2c.exe ---
if not exist "%LocalAppData%\MTDownloader\aria2c.exe" (
    color 0C
    echo [ERROR] aria2c.exe not found in %LocalAppData%\MTDownloader!
    echo Reinstall app to fix this issue.
    pause
    exit
)
"%LocalAppData%\MTDownloader\aria2c.exe" --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo [ERROR] aria2c.exe is not working properly!
    echo Try to install aria2 once again.
    pause
    exit
)
echo Checking connection with server...
ping -n 1 github.com >nul 2>&1

if %errorlevel% equ 0 (
    echo Connection with server is available. 
    goto update
) else (
    echo GitHub server's connection not found.
    set update=2
    pause
    goto menu
)

:update
curl https://raw.githubusercontent.com/MTSoftwareTeam/MTDownloader/refs/heads/main/ver --silent --output ver.txt
set /p new_ver=<"ver.txt"
del ver.txt /q
if %new_ver%==%ver% (
    set update=0
    goto menu
) else (
    set update=1

)

if not exist "config\theme.config" (
    mkdir config
    set first_run=1
    call config.bat
) else (
    set first_run=0
)
echo Loading settings...
for /f "delims=" %%v in ('"%LocalAppData%\MTDownloader\yt-dlp.exe" --version 2^>nul') do set ytdlp_ver=%%v
set /p close_after_download=<"config\close_after_download.config"
set /p check_updates=<"config\check_updates.config"
set /p theme=<"config\theme.config"
set /p cookies=<"config\cookies.config"
set /p resolution=<"config\resolution.config"
if not defined resolution set resolution=1080
if not defined cookies set cookies=0
if not defined close_after_download set close_after_download=0
if not defined check_updates set update=0
if not defined theme set theme=blue
if %theme%==light (
    color F0
) else if %theme%==dark (
    color 0F
) else if %theme%==blue (
    color 09
) else if %theme%==green (
    color 0a
) else if %theme%==red (
    color 0D
) else (
    color 09
)
rem The power grows with every IF statement :P
set "format=bestvideo[height<=%resolution%]+bestaudio[ext=m4a]/best[height<=%resolution%]"
if %check_updates%==0 set update=0

:menu
cd /d "%LocalAppData%\MTDownloader"
cls
type logo-mt.txt
echo.
echo Welcome in MTDownloader!
echo Version: %ver% %build%
echo TIP: You can download several videos at once by pasting more than one link after space bar.
if %update%==1 (
    echo New version is available: %new_ver%
) else (
    echo You already have the latest version.
)
echo 1) Download video as a music file          2) Download video in an MP4 format
echo 3) Download webpage from the Internet      4) Download video in the best available quality
echo 5) Update yt-dlp                           6) About app   
echo 7) Contact with the creators               8) Settings
set /p choose=[1,2,3,4,5,6,7,8]: 
if %choose%==1 cls && goto mp3
if %choose%==2 cls && goto mp4
if %choose%==3 cls && goto www
if %choose%==4 cls && goto best
if %choose%==5 cls && goto update_yt_dlp
if %choose%==6 cls && goto Info
if %choose%==7 cls && goto contact
if %choose%==8 cls && call config.bat
cls
goto menu


:mp3
Echo Paste the link of video you want to download and then press ENTER!
set /p link=Link:
if "%link%"=="" (
    echo No link provided!
    pause
    goto menu
)
echo Downloading...
cd /d %temp%\MTDOWNLOAD
if %cookies%==0 (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" -x --audio-format mp3 --no-warnings --restrict-filenames -q %link% 
) else (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" -x --audio-format mp3 --no-warnings --restrict-filenames --cookies "%LocalAppData%\MTDownloader\config\cookies.txt" -q %link%
)
if errorlevel 1 (
    echo Error has occurred while downloading! Check the link and Internet connectivity. And make sure that yt-dlp is updated.
    pause
    goto menu
)
cls
color 09
echo Downloading finished!
echo Press any key to open folder with downloaded file(s)!
echo REMEMBER: MOVE FILES SOMEWHERE!!!! THE FOLDER WILL BE DELETED AFTER APP CLOSURE OR AFTER RETURNING TO THE MENU!!!
pause>nul
start explorer %temp%\MTDOWNLOAD
pause
Echo App is cleaning the system after completed work...
rd %temp%\MTDOWNLOAD /s /q
if %close_after_download%==1 (
    exit
) else (
    goto menu
)

:mp4
Echo Paste the link of video you want to download and then press ENTER!
set /p link=Link:
if "%link%"=="" (
    echo No link provided!
    pause
    goto menu
)
echo Downloading...
cd /d %temp%\MTDOWNLOAD
if %cookies%==0 (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" --merge-output-format mp4 -f "%format%" -q %link%
) else (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" --merge-output-format mp4 -f "%format%" --cookies "%LocalAppData%\MTDownloader\config\cookies.txt"  -q %link%
)
if errorlevel 1 (
    echo Error has occurred while downloading! Check the link and Internet connectivity. And make sure that yt-dlp is updated.
    pause
    goto menu
)
cls
color 09
echo Downloading finished!
echo Press any key to open folder with downloaded file(s)!
echo REMEMBER: MOVE FILES SOMEWHERE!!!! THE FOLDER WILL BE DELETED AFTER APP CLOSURE OR AFTER RETURNING TO THE MENU!!!
pause>nul
start explorer %temp%\MTDOWNLOAD
pause
Echo App is cleaning the system after completed work...
rd %temp%\MTDOWNLOAD /s /q
if %close_after_download%==1 (
    exit
) else (
    goto menu
)

:best
Echo Wklej link flimu, który chcesz pobrać, a następnie kliknij ENTER!
set /p link=Link:
if "%link%"=="" (
    echo Nie podano linku!
    pause
    goto menu
)
echo Downloading...
cd /d %temp%\MTDOWNLOAD
if %cookies%==0 (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" -q %link%
) else (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --cookies "%LocalAppData%\MTDownloader\config\cookies.txt"  -q %link%
)
if errorlevel 1 (
    echo Error has occurred while downloading! Check the link and Internet connectivity. And make sure that yt-dlp is updated.
    pause
    goto menu
)
cls
color 09
echo Downloading finished!
echo Press any key to open folder with downloaded file(s)!
echo REMEMBER: MOVE FILES SOMEWHERE!!!! THE FOLDER WILL BE DELETED AFTER APP CLOSURE OR AFTER RETURNING TO THE MENU!!!
pause>nul
start explorer %temp%\MTDOWNLOAD
pause
Echo App is cleaning the system after completed work...
rd %temp%\MTDOWNLOAD /s /q
if %close_after_download%==1 (
    exit
) else (
    goto menu
)

rem If you're here, you probably want to download a website.
rem But it broke i guess?
rem Anyway, this code wasn't touched since it was added, so it may not work in the future.
rem also, WGET installation is not included in the installer, so you need to install it manually.
:www
echo Checking if wget is installed...
wget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo WGET is not installed. && pause
    goto menu
) else (
    echo WGET is installed. && goto www2
)
pause

:www2
Echo Provide the website's URL:
set /p url=URL: 
if "%url%"=="" (
    echo No link provided!
    pause
    goto menu
)
cd /d %temp%\MTDOWNLOAD
wget -m %url%
color 09
cls
echo Downloading finished!
echo Press any key to open folder with downloaded file(s)!
echo REMEMBER: MOVE FILES SOMEWHERE!!!! THE FOLDER WILL BE DELETED AFTER APP CLOSURE OR AFTER RETURNING TO THE MENU!!!
pause>nul
start explorer .
pause
Echo App is cleaning the system after completed work...
rd %temp%\MTDOWNLOAD /s /q
exit

:update_yt_dlp
cls
echo Updating yt-dlp...
del "%localappdata%\MTDownloader\yt-dlp.exe" /s /q
"%LocalAppData%\MTDownloader\aria2c.exe" https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -d "%LocalAppData%\MTDownloader" -o yt-dlp.exe
if exist "%LocalAppData%\MTDownloader\yt-dlp.exe" (
    echo Update has completed! Restart the app to apply changes.
) else (
    echo An error has occured while updating! Changes won't be applied.
)
pause
exit

:Info
cls
rem cool ass ASCII art
type logo.txt
echo.
echo ============================================================
echo About app
echo App version: %ver%
echo Release date: %date-rel%
echo YT-DLP version: %ytdlp_ver%
echo Build: %build%
if %update%==1 (
    echo New version: %new_ver%
    echo Update now!
)
echo ============================================================
echo Made by Mihot7.
echo Supported by MTSoftware.
echo App distrtibuted using the MIT license.
echo English translation by EksonN (@eksonnishere).
echo Thank you!
echo ============================================================
echo.
pause
goto menu

:contact
cls
echo Contact us!
echo.
echo If you have any questions, suggestions or you want to report an issue, contact us:
echo Email: zixmichal@gmail.com / dominik.santorski@ogarnij.se / superemeil@interia.pl
echo We respond fastest to messages at these addresses.
echo You can also text us on Discord: mihot
echo If you want to report an issue, use the "issues" tab on GitHub.
echo Our less active e-mail: MTSoftware@goracapoczta.pl
echo Our website: https://mtsoftware.online
echo.
echo Thank you for using our app!
pause
goto menu

