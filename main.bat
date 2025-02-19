@echo off
cls
title MTDownloader %ver%
mode 65,20
set ver=3.0

@chcp 65001>nul
cls
color 09
if not exist %temp%\MTDOWNLOAD md %temp%\MTDOWNLOAD
set "elems[0]=Linki możesz odzielać spacją, aby pobrać parę filmów."
set "elems[1]=Program jest napędzany przez YT-DLP"
set "elems[2]=Jeśli program nie działa, zaktualizuj go..."
set "elems[3]=Program jest portable, odpalisz go z pendrive."
set "elems[4]=Program zawsze pobiera film w najwyższej dostępnej jakości"
set "elems[5]=Dzięki za pobranie!"

:menu
set /a _rand=(%RANDOM% * 6 /32768) 
cls
echo Witaj, w programie MTDownloader!
echo Wersja: %ver% - 19.02.2025
call echo TIP: %%elems[%_rand%]%%
echo 1. Pobierz film jako dzwięk (MP3)
echo 2. Pobierz film w formacie MP4
echo 3. Informacje o programie
set /p choose=[1,2,3]: 
if %choose%==1 goto mp3
if %choose%==2 goto mp4
if %choose%==3 goto info
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
color 09
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
color 09
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
cls
echo Wersja programu %ver%
echo Wersja YT-DLP: 2025.02.19
echo Wersja ffmpeg: 7.0
echo Program na licencji MIT
echo Program rozwijany przez:
echo MTSoftware (Mihot7) 2024-2025
echo Kliknij coś, aby wrócić!
pause>nul
goto menu