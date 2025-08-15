::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCmLNGSuUYk47fvw++WXnmApcO0odoPU27CLMq0e60zqSZUi2HxTn4UODQ84
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
::ZQ0/vhVqMQ3MEVWAtB9wCRdERAXi
::Zg8zqx1/OA3MEVWAtB9wHBpfLA==
::dhA7pRFwIByZRRmm5kM7SA==
::Zh4grVQjdCyDJGyX8VAjFDZdRAuWa1eeA6YX/Ofr08ezhkIKWu4weYveyPmDIekd1mjQUZk62HZVmc8JHlVdZhfL
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
@chcp 65001>nul
cd /d "%LocalAppData%\MTDownloader
cls
title MTDownloader %ver%
mode 65,20
set ver=6.0
cls
color 09
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD
set "elems[0]=Linki możesz odzielać spacją, aby pobrać parę filmów."
set "elems[1]=Program jest napędzany przez YT-DLP"
set "elems[2]=Jeśli program nie działa, zaktualizuj go za pomocą aktualizatora!"
set "elems[3]=Program jest portable, odpalisz go z pendrive."
set "elems[4]=Program zawsze pobiera film w najwyższej dostępnej jakości"
set "elems[5]=Dzięki za pobranie!"
set "elems[6]=Jak pobierzesz strone, odpal plik index.html, aby ją zobaczyć!"
echo Sprawdzanie połączenia z serwerem...
ping -n 1 github.com >nul 2>&1

if %errorlevel% equ 0 (
    echo Polaczenie z serwerem jest dostępne. 
    goto update
) else (
    echo Brak polaczenia z serwerem github.
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
)
echo Ładowanie ustawień...
set /p close_after_download=<"config\close_after_download.config"
set /p check_updates=<"config\check_updates.config"
set /p theme=<"config\theme.config"
if not defined close_after_download set close_after_download=0
if not defined check_updates set update=0
if not defined theme set theme=3
if %theme%==light (
    color 0F
) else if %theme%==dark (
    color 0A
) else if %theme%==blue (
    color 09
) else if %theme%==green (
    color 0C
) else if %theme%==red (
    color 0D
) else (
    color 09
)


:menu
set /a _rand=(%RANDOM% * 7 /32768) 
cls
echo Witaj, w programie MTDownloader!
echo Jeśli coś nie działa, dawaj update!
if %update%==1 echo Dostępna nowa wesja!
echo UWAŻAJ: Używasz programu w wersji rozwojowej, mogą wystąpić błędy!
echo Wersja: %ver% Alpha 1 - 11.08.2025
call echo TIP: %%elems[%_rand%]%%
echo 1. Pobierz film jako dzwięk (MP3)
echo 2. Pobierz film w formacie MP4
echo 3. Pobierz witryne z sieci
echo 4. Informacje o programie
set /p choose=[1,2,3,4]: 
if %choose%==1 goto mp3
if %choose%==2 goto mp4
if %choose%==3 goto www
if %choose%==4 goto info
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
"%LocalAppData%\MTDownloader\yt-dlp.exe" -x --audio-format mp3 --no-warnings --restrict-filenames -q %link% 
cls
color 09
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
echo PAMIĘTAJ: PRZENIEŚ GDZIEŚ PLIK!!!! ZOSTANIE ON USUNIĘTY PO ZAMKNIĘCIU PROGRAMU!!!
pause>nul
start explorer %temp%\MTDOWNLOAD
pause
Echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
if %close_after_download%==1 (
    exit
) else (
    goto menu
)

:mp4
Echo Wklej link flimu, który chcesz pobrać, a następnie kliknij ENTER!
set /p link=Link:
echo Pobieranie...
cd /d %temp%\MTDOWNLOAD
"%LocalAppData%\MTDownloader\yt-dlp.exe" --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" -q %link%
cls
color 09
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
echo PAMIĘTAJ: PRZENIEŚ GDZIEŚ PLIK!!!! ZOSTANIE ON USUNIĘTY PO ZAMKNIĘCIU PROGRAMU!!!
pause>nul
start explorer %temp%\MTDOWNLOAD
pause
Echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
if %close_after_download%==1 (
    exit
) else (
    goto menu
)


:www
echo Sprawdzanie, czy wget jest zainstalowany...
wget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo WGET nie jest zainstalowany. && pause
    goto menu
) else (
    echo WGET jest zainstalowany. && goto www2
)
pause

:www2
Echo Proszę podać URL witryny:
set /p url=URL: 
cd /d %temp%\MTDOWNLOAD
wget -m %url%
color 09
cls
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobraną stroną!
echo PAMIĘTAJ: PRZENIEŚ GDZIEŚ FOLDER!!!! ZOSTANIE ON USUNIĘTY PO ZAMKNIĘCIU PROGRAMU!!!
pause>nul
start explorer .
pause
Echo Program oczyszcza system po zakończeniu pracy...
rd %temp%\MTDOWNLOAD /s /q
exit

:Info
cls
echo Wersja programu %ver%
echo Program na licencji MIT
echo Program rozwijany przez:
echo MTSoftware (Mihot7) 2024-2025
if %update%==1 echo Nowsza wersja programu dostępna: %new_ver%
echo Kliknij coś, aby wrócić!
pause>nul
goto menu