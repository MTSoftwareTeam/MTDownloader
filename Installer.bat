::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHTeyGY1OxBAQxS+EV+eCaIS5Of66++V70kYQuczd5/W37qabeUd1mjQUZk62HZVmc8JHltxcAG/bwM4rHwMpnfUVw==
::fBE1pAF6MU+EWHTeyGY1OxBAQxS+EV+eCaIS5Of66++V70kYQuczd5/W37qabeUd1mjQUZk62HZVmc8JHltxcAG/bwM4rHwPs2rLJ9TN0w==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCKDJH2B50kkJwtoYTCmM3y0Crod7O3pou6CtEgRW/IyfYHPl7GAHMQc/Uvoepcp02gUkcgDQhJbcXI=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJiZks0
::ZQ05rAF9IBncCkqN+0xwdVsGAlTi
::ZQ05rAF9IAHYFVzEqQIdHD9bWwqOM2q+A6dc/+35r+OJsVkcWO46au8=
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSwx002PAxVXgHi
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEphJifXs=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCKDJH2B50kkJwtoYTCmM3y0Crod7O3p0P2CoHIOUfYqaMHewrHu
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001
title New MTDownloader setup 2.0
:menu
echo Wybierz język / Choose language!
echo 1. Polish
echo 2. English
set /p choose=Choose: 
if %choose%==1 powershell -NoProfile -ExecutionPolicy Bypass -File "MTDownloader Installer.ps1" && goto complete
if %choose%==2 powershell -NoProfile -ExecutionPolicy Bypass -File "MTDownloader Installer-en.ps1" && goto complete
echo Nie prawidłowy wybór / Invalid input.
pause
goto menu

:complete
cls
echo =======================
echo Installation complete!
echo =======================
pause
exit