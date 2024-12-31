::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHTeyGY1OxBAQxS+JX+GALMR+O38oe+fpy0=
::fBE1pAF6MU+EWHTeyGY1OxBAQxS+JX+GALMM5Onioe+fpy0=
::fBE1pAF6MU+EWHTeyGY1OxBAQxS+JX+GALMM+uf56qSCukh9
::fBE1pAF6MU+EWHTeyGY1OxBAQxS+JX+GH6FR7OTroe+fpy0=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCKDJH2B50kkJwtoVRC+GGStCLkT6ez+/aSOoUJ9
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIdHD9bWwqOM2q+A6d8
::eg0/rx1wNQPfEVWB+kM9LVsJDCm2GGStCLkT6ez+/aSCukh9
::fBEirQZwNQPfEVWB+kM9LVsJDCm2E1j6IroL5uT07u6CsC0=
::cRolqwZ3JBvQF1fEqQIAOhRTXgWPfG+1RqUT6uH+/euJq0xdRO42cywIzfSjELNT8AXdeoMZw3hf+A==
::dhA7uBVwLU+EWHSN/E0kf3s=
::YQ03rBFzNR3SWATE1lAxI3s=
::dhAmsQZ3MwfNWATE2Us4Jw8DDEnCbjvoUtU=
::ZQ0/vhVqMQ3MEVWAtB9wBhJRLA==
::Zg8zqx1/OA3MEVWAtB9wBhJRLA==
::dhA7pRFwIByZRRmz8VAjIhoUTgGWPSv3RrcJ4eT/tarV8h9JGbNtNdyLug==
::Zh4grVQjdCKDJH2B50kkJwtoVRC+PmK0OpgozOfs4eaIo0kYRqw6YIq7
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title MTDownloader - Menu
mode 50,20
@chcp 65001
color 90
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD
echo Witaj, w programie MTDownloader!
echo BUILD 1.0 - 31.12.2024
Echo Wklej link flimu, który chcesz pobrać, a następnie kliknij ENTER!
set /p link=Link:
echo Pobieranie...
cd /d %temp%\MTDOWNLOAD
%~dp0yt-dlp.exe -x --audio-format mp3 --no-warnings --restrict-filenames %link%
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
