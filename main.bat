@echo off
cls
title MTDownloader %ver%
mode 50,20
set ver=2.0
set update=0

@chcp 65001
color 90
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD
:menu
echo Witaj, w programie MTDownloader!
echo BUILD %ver% - 07.01.2025
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
echo Program na licensji MIT
echo Program rozwyjany przez:
echo Mihot7 (Michał) 2024-2025
echo Kliknij coś, aby wrócić!
pause>nul
goto menu