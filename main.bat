::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCmLNGSuUYk47fvw++WXnmApcO0odoPU27CLMq0e60zqSZoi0XUUjNMYbA==
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
::ZQ0/vhVqMQ3MEVWAtB9wGh5VQAWROSuZB7sY4ez6++/H8y0=
::Zg8zqx1/OA3MEVWAtB9wHBpfLA==
::dhA7pRFwIByZRRmm5kM7SA==
::Zh4grVQjdCyDJGyX8VAjFDZdRAuWa1eeA6YX/Ofr08ezhkIKWu4weYveyPmDIekd1mjQUZk62HZVmc8JHlVdZhfL
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983

rem Production cycle:
rem 1. Alpha - Development version, adds new features, may contain bugs.
rem 2. Beta - Testing version, fixes bugs, may still add some features.
rem 3. Release Candidate - Final testing version, no new features, only bug fixes.
rem 4. Stable - Final version, no bugs, no new features, only security updates.
@echo off
@chcp 65001>nul
cd /d "%LocalAppData%\MTDownloader
cls
set build=Release Candidate 1
rem This is the version of the program, it will be displayed in the title.
title MTDownloader %ver% %build%
rem This line is not needed anymore, but it was used to set the console size.
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
rem Most of them aren't even true anymore, but I don't care.
rem Those weren't updated since like 3.0 so they are outdated.
rem I'll need to change them in the future.
rem Maybe in later RC builds.
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
rem For the sake of my sanity, WINDOWS DEFENDER FUCK OFF. This ain't malware, it's just bat2exe...
rem Microsoft, for the love of God, FIX YOUR DAMN ANTIVIRUS!
if %update%==1 echo Dostępna nowa wesja!
echo UWAŻAJ: Używasz programu w wersji rozwojowej, mogą wystąpić błędy!
echo Wersja: %ver% %build% - 13.08.2025
call echo TIP: %%elems[%_rand%]%%
echo 1. Pobierz film jako dzwięk (MP3)
echo 2. Pobierz film w formacie MP4
echo 3. Pobierz witryne z sieci
echo 4. Ustawienia
echo 5. Aktualizator yt-dlp
echo 6. Informacje o programie
echo 7. Skontaktuj się z nami!
set /p choose=[1,2,3,4,5,6]: 
if %choose%==1 goto mp3
if %choose%==2 goto mp4
if %choose%==3 goto www
if %choose%==4 call config.bat
if %choose%==5 goto update_yt_dlp
if %choose%==6 goto Info
if %choose%==7 goto contact
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
if errorlevel 1 (
    echo Błąd podczas pobierania! Sprawdź link lub połączenie z internetem. Oraz upewnij się, że yt-dlp jest aktualny.
    pause
    goto menu
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
rem Bo z tym programem się zawsze jest. I się zawsze na niego kurwa czeka.
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
if errorlevel 1 (
    echo Błąd podczas pobierania! Sprawdź link lub połączenie z internetem. Oraz upewnij się, że yt-dlp jest aktualny.
    pause
    goto menu
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

rem If you're here, you probably want to download a website.
rem But it broke i guess?
rem Anyway, this code wasn't touched since it was added, so it may not work in the future.
rem also, WGET installation is not included in the installer, so you need to install it manually.
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
rem cool ass ASCII art
type logo.txt
echo.
echo ============================================================
echo Informacje o programie
echo Wersja programu: %ver%
echo Wersja YT-DLP: %ytdlp_ver%
echo Wydanie: %build%
if %update%==1 (
    echo Nowa wersja: %new_ver%
    echo Zaktualizuj!
)
echo ============================================================
echo Stworzone przez Mihot7
echo Rozwijane przez MTSoftware
echo Program rozpowszechniany jest za pomocą licencji MIT
echo Angielskie tłumaczenie wykonał EksonN
echo Dziękujemy!
echo ============================================================
echo.
pause
goto menu

:contact
cls
echo Skontaktuj się z nami!
echo.
echo Jeśli masz jakieś pytania, sugestie lub chcesz zgłosić błąd, skontaktuj się z nami:
echo Email: zixmichal@gmail.com / dominik.santorski@ogarnij.se / superemeil@interia.pl
echo Najszybciej odpowiadamy na wiadomości na tych adresach.
echo Możesz też do nas napisać na Discordzie: mihot
echo Jeśli chcesz zglosić błąd, użyj zakładki issues na githubie.
echo Nasz mniej aktywny e-mail: MTSoftware@goracapoczta.pl
echo Nasza strona internetowa: https://mtsoftware.online
echo.
echo Dziękujemy za korzystanie z naszego programu!
pause
goto menu

