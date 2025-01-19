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
::cxY6rQJ7JhzQF1fEqQJiZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsGAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIdHD9bWwqOM2q+A6dOiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDCm2GGStCLkT6ez+/aSCukh9
::fBEirQZwNQPfEVWB+kM9LVsJDCm2GGStCLkT6ez+/Yo=
::cRolqwZ3JBvQF1fEqQIAOhRTXgWPfG+1RqUT6uH+/euJq0xdUuszdSwIzfSUYOkd/kD2e5M5wxo=
::dhA7uBVwLU+EWHSwx002PAxVXgHCdEazDroIv6Gb
::YQ03rBFzNR3SWATE1lAxI3s=
::dhAmsQZ3MwfNWATE2Us4Jw8DDFbSbj7a
::ZQ0/vhVqMQ3MEVWAtB9wBhJRLA==
::Zg8zqx1/OA3MEVWAtB9wBhJRLA==
::dhA7pRFwIByZRRmm5kM7SA==
::Zh4grVQjdCKDJH2B50kkJwtoYTCmM3y0Crod7O3poe+fpy0=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cls
title MTDownloader %ver%
mode 50,20
set ver=2.1

@chcp 65001
color 90
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD
:menu
echo Witaj, w programie MTDownloader!
echo BUILD %ver% - 15.01.2025
echo 1. Pobierz film jako dzwięk (MP3)
echo 2. Pobierz film w formacie MP4
echo 3. Informacje o programie
set /p choose=[1,2,3]: 
if %choose%==1 goto mp3
if %choose%==2 goto mp4
if %choose%==3 goto Info
cls
echo Opcja nie znana!!!!
echo Naciśnij coś!
pause>nul
cls
goto menu

:mp3
Echo Wklej link flimu, który chcesz pobrać, a następnie kliknij ENTER!
set /p link=Link:
echo Pobieranie...
cd /d %temp%\MTDOWNLOAD
%~dp0yt-dlp.exe -x --audio-format mp3 --no-warnings --restrict-filenames -q %link% 
cls
color 90
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
echo PAMIĘTAJ: PRZENIEŚ GDZIEŚ PLIK!!!! ZOSTANIE ON USUNIĘTY PO ZAMKNIĘCIU PROGRAMU!!!
pause>nul
start explorer %temp%\MTDOWNLOAD
pause
Echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
exit

:mp4
Echo Wklej link flimu, który chcesz pobrać, a następnie kliknij ENTER!
set /p link=Link:
echo Pobieranie...
cd /d %temp%\MTDOWNLOAD
%~dp0yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" -q %link%
cls
color 90
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
echo PAMIĘTAJ: PRZENIEŚ GDZIEŚ PLIK!!!! ZOSTANIE ON USUNIĘTY PO ZAMKNIĘCIU PROGRAMU!!!
pause>nul
start explorer %temp%\MTDOWNLOAD
pause
Echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
exit

:Info
echo Wersja programu %ver%
echo Wersja YT-DLP: 2024.12.23
echo Wersja ffmpeg: 7.0
echo Program na licencji MIT
echo Program rozwyjany przez:
echo MTSoftware (Mihot7) 2024-2025
echo Kliknij coś, aby wrócić!
pause>nul
goto menu