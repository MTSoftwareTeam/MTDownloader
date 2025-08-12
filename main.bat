::[Bat To Exe Converter]
::
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
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
@chcp 65001>nul
cd /d "%LocalAppData%\MTDownloader
cls
title MTDownloader %ver%
rem Rest in piss forever miss, Windows 11 needs to be able to run this program without this line.
rem mode 65,20
set ver=6.0
cls
color 09
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD
set "elems[0]=Linki możesz odzielać spacją, aby pobrać parę filmów."
set "elems[1]=Program jest napędzany przez YT-DLP"
set "elems[2]=Jeśli program nie działa, zaktualizuj go za pomocą aktualizatora!"
set "elems[3]=Wersje Alpha są wersjami rozwojowymi, mogą wystąpić błędy!"
set "elems[4]=Jeśli chcesz zgłosić błąd, napisz na mail: zixmichal@gmail.com"
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
) else (
    set first_run=0
)
echo Ładowanie ustawień...
set /p close_after_download=<"config\close_after_download.config"
set /p check_updates=<"config\check_updates.config"
set /p theme=<"config\theme.config"
set /p cookies=<"config\cookies.config"
set /p resolution=<"config\resolution.config"
if not defined resolution set resolution=1080
if not defined cookies set cookies=0
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
rem The power grows with every IF statement :P
if "%resolution%"=="best" (
    set "format=bestvideo+bestaudio[ext=m4a]/best"
) else (
    set "format=bestvideo[height<=%resolution%]+bestaudio[ext=m4a]/best[height<=%resolution%]"
)
if %check_updates==0 set update=0
:menu
set /a _rand=(%RANDOM% * 7 /32768) 
cls
echo Witaj, w programie MTDownloader!
echo Jeśli coś nie działa, dawaj update!
if %update%==1 echo Dostępna nowa wesja!
echo UWAŻAJ: Używasz programu w wersji rozwojowej, mogą wystąpić błędy!
echo Wersja: %ver% Beta 1 - 12.08.2025
call echo TIP: %%elems[%_rand%]%%
echo 1. Pobierz film jako dzwięk (MP3)
echo 2. Pobierz film w formacie MP4
echo 3. Pobierz witryne z sieci
echo 4. Ustawienia
echo 5. Aktualizator yt-dlp
echo 6. Informacje o programie
set /p choose=[1,2,3,4,5,6]: 
if %choose%==1 goto mp3
if %choose%==2 goto mp4
if %choose%==3 goto www
if %choose%==4 call config.bat
if %choose%==5 goto update_yt_dlp
if %choose%==6 goto Info
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
if %cookies%==0 (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" -x --audio-format mp3 --no-warnings --restrict-filenames -q %link% 
) else (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" -x --audio-format mp3 --no-warnings --restrict-filenames --cookies config\cookies.txt -q %link%
)
cls
color 09
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
echo PAMIĘTAJ: PRZENIEŚ GDZIEŚ PLIK!!!! ZOSTANIE ON USUNIĘTY PO ZAMKNIĘCIU PROGRAMU LUB POWROTU DO MENU!!!
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
rem I hate myself
if %cookies%==0 (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" --merge-output-format mp4 -f "%format%" -q %link%
) else (
    "%LocalAppData%\MTDownloader\yt-dlp.exe" --merge-output-format mp4 -f "%format%" --cookies config\cookies.txt  -q %link%
)
cls
color 09
echo Pobieranie zakończone!
echo Naciśnij coś, aby otworzyć folder z pobranym plikiem!
echo PAMIĘTAJ: PRZENIEŚ GDZIEŚ PLIK!!!! ZOSTANIE ON USUNIĘTY PO ZAMKNIĘCIU PROGRAMU LUB POWROCIE DO MENU!!!
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

:update_yt_dlp
cls
echo Aktualizowanie yt-dlp...
del "%localappdata%\MTDownloader\yt-dlp.exe" /s /q
"%LocalAppData%\MTDownloader\aria2c.exe" https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -d "%LocalAppData%\MTDownloader" -o yt-dlp.exe
if exist "%LocalAppData%\MTDownloader\yt-dlp.exe" (
    echo Aktualizacja zakończona! Uruchom ponownie program, aby zobaczyć zmiany.
) else (
    echo Aktualizacja nie powiodła się! Zmiany nie zostaną zastosowane.
)
pause
exit

:Info
cls
rem Tak naprawdę, to wszystkie wersje przed 5.0 są nieużywalne. Bo YT-DLP był w nie zintegrowany, a teraz nadal możesz używać 5.0, nawet kiedy będzie 10.0, bo instalator sam pobiera YT-DLP.
echo Informacje o programie:
echo Program MTDownloader jest narzędziem do pobierania filmów z YouTube i innych stron internetowych.
echo Program jest rozwijany przez MTSoftware (Mihot7) i jest dostępny na licencji MIT.
echo Angielskie tłumaczenie wykonał: EksonN
echo Wersja programu %ver%
echo Program na licencji MIT
echo Program rozwijany przez:
echo MTSoftware (Mihot7) 2024-2025
if %update%==1 echo Nowsza wersja programu dostępna: %new_ver%
echo Kliknij coś, aby wrócić!
pause>nul
goto menu