@REM MTDownloader
@REM Version: 4.2
@REM Date: 10.04.2025
@REM Description: A simple batch script to download videos from various sources using yt-dlp and wget.
@REM Author: Mihot7 (MTSoftwareTeam)
@REM Fork of version 4.1 edited by Klubuntu

::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCmLNGSuUYkx3Mz0+OSLrUwZUfADfonWyrGJbuUL7yU=
::fBE1pAF6MU+EWHreyHcjLQlHcCmLNGSuUYkx3Mz0+OSLrUwZUfADYZuW3riebuUL7yU=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDZdRAuWa1eXMpET/+b34OuDp18hcO0odoPU27CLMq4a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJkZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsAAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIdHD9bWwqOM2q+A6dIiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDCm2GGStCLkT6ez+/aSCukh9
::fBEirQZwNQPfEVWB+kM9LVsJDCm2GGStCLkT6ez+/b7Jp1UYNA==
::cRolqwZ3JBvQF1fEqQIUKQlZQxObfHuoCbIO6eW76+XHskIfXecteYHS29Q=
::dhA7uBVwLU+EWHSwx002PAxVXgHi
::YQ03rBFzNR3SWATE1lAxI3s=
::dhAmsQZ3MwfNWATE2Us4Jw8DDCm2D2S8EqId+u27vbrV9y0=
::ZQ0/vhVqMQ3MEVWAtB9wBhJRLA==
::Zg8zqx1/OA3MEVWAtB9wBhJRLA==
::dhA7pRFwIByZRRmm5kM7SA==
::Zh4grVQjdCKDJH2B50kkJwtoYTCmM3y0Crod7O3poe+fpy0=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983

@echo off
@chcp 65001 >nul
cls
title MTDownloader 4.2
mode 65,20

set "ver=4.2"
set "ytdlp_path=%cd%\bin\yt-dlp.exe"
set "output_dir=%USERPROFILE%\Videos\MTDownloader"

cls
color 09
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD

set "elems[0]=Linki możesz odzielać spacją, aby pobrać parę filmów."
set "elems[1]=Program jest napędzany przez YT-DLP"
set "elems[2]=Jeśli program nie działa, zaktualizuj go..."
set "elems[3]=Program jest portable, odpalisz go z pendrive."
set "elems[4]=Program zawsze pobiera film w najwyższej dostępnej jakości"
set "elems[5]=Dzięki za pobranie!"
set "elems[6]=Jak pobierzesz strone, odpal plik index.html, aby ją zobaczyć!"

echo Sprawdzanie połączenia z serwerem...
ping -n 1 github.com >nul 2>&1

if %errorlevel% equ 0 (
    echo Połączenie z serwerem jest dostępne.
    goto update
) else (
    echo Brak połączenia z serwerem github.
    set update=2
    pause
    goto menu
)

:update
curl https://raw.githubusercontent.com/MTSoftwareTeam/MTDownloader/refs/heads/main/ver --silent --output info\ver.txt
set /p new_ver=<"info\ver.txt"
del info\ver.txt /q
if "%new_ver%"=="%ver%" (
    set update=0
    goto menu
) else (
    set update=1
)

:menu
set /a _rand=(%RANDOM% * 7 /32768)
cls
echo Witaj, w programie MTDownloader!
if %update%==1 echo Dostępna nowa wersja! Jeśli napotkasz problem zaktualizuj.
echo Wersja: %ver% - 31.03.2025
call echo TIP: %elems[%_rand%]%%
echo 1. Pobierz film jako dźwięk (MP3)
echo 2. Pobierz film w formacie MP4
echo 3. Pobierz witrynę z sieci
echo 4. Informacje o programie
set /p choose=[1,2,3,4]: 
if "%choose%"=="1" goto mp3
if "%choose%"=="2" goto mp4
if "%choose%"=="3" goto www
if "%choose%"=="4" goto info
cls
echo Opcja nieznana!!!!
echo Naciśnij coś!
pause >nul
cls
goto menu

:mp3
@echo off
setlocal enabledelayedexpansion

echo Wklej link filmu, ktory chcesz pobrac, a nastepnie kliknij ENTER!
set /p link="Link: "
set "link=!link: =!"

echo Pobieranie...

"%ytdlp_path%" -x --audio-format mp3 --no-warnings --restrict-filenames -q -o "%output_dir%\%%(title)s.%%(ext)s" "!link!"
if %ERRORLEVEL% neq 0 (
    echo Wystapil blad podczas pobierania pliku.
    echo Command executed: "%ytdlp_path%" -x --audio-format mp3 --no-warnings --restrict-filenames -q -o "%output_dir%\%(title)s.mp3" "!link!"
) else (
    echo Pobieranie zakonczone pomyslnie!
)

pause
endlocal

cls
color 09
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
pause >nul
start explorer "%output_dir%"
pause
echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
exit

:mp4
echo Wklej link filmu, który chcesz pobrać, a następnie kliknij ENTER!
set /p link=Link:
echo Pobieranie...
cd /d %temp%\MTDOWNLOAD

if not exist "%output_dir%" (
    mkdir "%output_dir%"
)

"%ytdlp_path%" --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" -q -o "%output_dir%\%%(title)s.%%(ext)s" %link%

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas pobierania pliku.
    pause
    exit /b
)

cls
color 09
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
pause >nul
start explorer "%output_dir%"
pause
echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
exit

:www
echo Sprawdzanie, czy wget jest zainstalowany...
wget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo WGET nie jest zainstalowany.
    echo Instalowanie...
    winget install wget
    goto www2
) else (
    echo WGET jest zainstalowany.
    goto www2
)

:www2
echo Proszę podać URL strony, którą chcesz pobrać:
echo Uwaga: Pobieranie może zająć trochę czasu, w zależności od rozmiaru strony.
set /p url=URL: 
cd /d %temp%\MTDOWNLOAD
wget -m %url%
color 09
cls
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobraną stroną!
pause >nul
start explorer .
pause
echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
exit

:info
cls
echo Wersja programu: %ver%
echo Wersja YT-DLP: 2025.03.31
echo Wersja ffmpeg: 7.0
echo Program na licencji MIT
echo Program rozwijany przez:
echo MTSoftwareTeam (Mihot7) 2024–2025
if %update%==1 echo Nowsza wersja programu dostępna: %new_ver%
echo Kliknij coś, aby wrócić!
pause >nul
goto menu

