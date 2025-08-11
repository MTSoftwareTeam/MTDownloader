@echo off
title MTDownloader - Ustawienia
mode 65,20
if %first_run%==1 (
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
echo Ustawienia zostały zapisane. Zostaną użyte przy następnym uruchomieniu programu.
pause
echo exit.
