@echo off
title MTDownloader - Ustawienia
if "%first_run%"=="1" (
    echo Witaj w MTDownloader!
    echo Przygotowywujemy cię na uruchomienie programu.
    echo Ustawienia zostaną zapisane w katalogu config.
    pause
    goto setup
)

:menu
echo Wybierz opcję:
echo 1. Zmień ustawienia
echo 2. Wyświetl aktualną konfigurację
echo 3. Wyjdź z programu
set /p choice=Twój wybór:
if "%choice%"=="1" (
    goto setup
) else if "%choice%"=="2" (
    echo Aktualna konfiguracja:
    echo Zamknij po pobraniu: %close_after_download%
    echo Sprawdzaj aktualizacje: %check_updates%
    echo Motyw: %theme%
    echo Pliki cookies: %cookies%
    echo Rozdzielczość: %resolution%
    pause
    goto menu
) else if "%choice%"=="3" (
    exit
) else (
    echo Nieprawidłowy wybór, spróbuj ponownie.
    goto menu
)




:setup
echo Zadam kilka pytań, aby skonfigurować program.
echo Czy program ma zamykać się po pobraniu pliku? (T/N)
set /p close_after_download=Odpowiedź:
if /i "%close_after_download%"=="T" (
    set close_after_download=1
) else (
    set close_after_download=0
)
echo %close_after_download% > config\close_after_download.config
echo Czy chcesz, aby program sprawdzał aktualizacje? (T/N)
set /p check_updates=Odpowiedź:
if /i "%check_updates%"=="T" (
    set check_updates=1
) else (
    set check_updates=0
)
echo %check_updates% > config\check_updates.config
echo Wybierz motyw.
echo 1. Jasny
echo 2. Ciemny
echo 3. Niebieski (domyślny)
echo 4. Zielony 
echo 5. Czerwony
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
    echo Nieprawidłowy wybór, ustawiam motyw na niebieski.
    set theme=blue
)
echo %theme% > config\theme.config
echo Podaj swoje pliki cookies!
echo Jeśli nie masz pliku cookies, zostaw wpisz NIE.
set /p cookies=Pliki cookies (podaj ścieżkę do pliku), drag'n'drop działa:
if not exist "%cookies%" (
    echo Plik cookies nie istnieje. Nie użyje cookies
    set cookies=0
    echo %cookies% > config\cookies.config
) else (
    echo 1 > config\cookies.config
    copy "%cookies%" config\cookies.txt >nul 2>&1
    echo Plik cookies został zapisany.
)
echo Podaj rozdzielczość, w której chcesz pobierać filmy
echo 1. Najlepsza dostępna
echo 2. 1440p
echo 3. 1080p
echo 4. 720p
echo 5. 480p
echo 6. 360p
echo 7. 240p
echo 8. 144p
set /p resolution=Rozdzielczość:
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
    echo Nieprawidłowy wybór, ustawiam rozdzielczość na 1080p.
    set resolution=1080
)
echo Ustawienia zostały zapisane. Zostaną użyte przy następnym uruchomieniu programu.
pause
start MTDownloader.exe
exit
