#------------------------
#-kazukikasama Solutions-
#-Mihot7's mod for MTD
#------------------------
#make dir in current user appdata
$desktop = [Environment]::GetFolderPath("Desktop")
remove-item -fo $Env:LOCALAPPDATA\MTDownloader -recurse
remove-item -fo "$desktop\MTDownloader.lnk" -recurse
remove-item -fo ("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\MTDownloader.lnk") -recurse
echo Witaj w MTDownloader!
mkdir $Env:LOCALAPPDATA\MTDownloader

#Download aria2, yt-dlp, ffmpeg and MTDownloader from official sites current releases
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
echo Pobieranie...
Invoke-WebRequest https://github.com/aria2/aria2/releases/download/release-1.37.0/aria2-1.37.0-win-32bit-build1.zip -OutFile $Env:LOCALAPPDATA\MTDownloader\aria2.zip
Expand-Archive $Env:LOCALAPPDATA\MTDownloader\aria2.zip -DestinationPath $Env:LOCALAPPDATA\MTDownloader\
Copy-Item -Path "$Env:LOCALAPPDATA\MTDownloader\aria2-1.37.0-win-32bit-build1\aria2c.exe" -Destination "$Env:LOCALAPPDATA\MTDownloader"

& $Env:LOCALAPPDATA\MTDownloader\aria2c.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -d $Env:LOCALAPPDATA\MTDownloader\ -o yt-dlp.exe
& $Env:LOCALAPPDATA\MTDownloader\aria2c.exe https://raw.githubusercontent.com/MTSoftwareTeam/MTDownloader/c57238d7ebefb70e9cfdb1e66e74aa7e4d28d4b5/ffmpeg.exe -d $Env:LOCALAPPDATA\MTDownloader\ -o ffmpeg.exe
& $Env:LOCALAPPDATA\MTDownloader\aria2c.exe https://github.com/MTSoftwareTeam/MTDownloader/releases/latest/download/MTDownloader.exe -d $Env:LOCALAPPDATA\MTDownloader\ -o MTDownloader.exe
echo Pobieranie zakończone!
#extract ffmpeg
Expand-Archive $Env:LOCALAPPDATA\MTDownloader\ffmpeg.zip -DestinationPath $Env:LOCALAPPDATA\MTDownloader\
echo Wypakowywanie...
#copy ffmpeg and delete dowloaded extra files
Copy-Item -Path "$Env:LOCALAPPDATA\MTDownloader\ffmpeg-master-latest-win64-gpl\bin\*" -Destination "$Env:LOCALAPPDATA\MTDownloader"
remove-item -fo $Env:LOCALAPPDATA\MTDownloader\ffmpeg-master-latest-win64-gpl -recurse
remove-item -fo $Env:LOCALAPPDATA\MTDownloader\ffmpeg.zip -recurse
remove-item -fo $Env:LOCALAPPDATA\MTDownloader\aria2-1.37.0-win-32bit-build1 -recurse
remove-item -fo $Env:LOCALAPPDATA\MTDownloader\aria2.zip -recurse
echo Wypakowywanie zakończone!
#make shorcut in Destop
echo Tworzenie skrótów....
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$desktop\MTDownloader.lnk")
$Shortcut.TargetPath="$Env:LOCALAPPDATA\MTDownloader\MTDownloader.exe"
$Shortcut.Arguments=""
$Shortcut.IconLocation="$Env:LOCALAPPDATA\MTDownloader\MTDownloader.exe"
$Shortcut.Save()

#make shorcut in Start Menu
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\MTDownloader.lnk")
$Shortcut.TargetPath="$Env:LOCALAPPDATA\MTDownloader\MTDownloader.exe"
$Shortcut.Arguments=""
$Shortcut.IconLocation="$Env:LOCALAPPDATA\MTDownloader\MTDownloader.exe"
$Shortcut.Save()
echo Utworzono
#make uninstaller Entry Through Settings (default windows option for remove programs)
echo Tworzenie opcji odinstalowania...
$key = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MTDownloader"
New-Item -Path $key
New-ItemProperty -Path $key -Name "DisplayIcon" -Value "$Env:LOCALAPPDATA\MTDownloader\MTDownloader.exe"  -PropertyType "String"
New-ItemProperty -Path $key -Name "DisplayName" -Value "MTDownloader"  -PropertyType "String"
New-ItemProperty -Path $key -Name "InstallLocation" -Value "$Env:LOCALAPPDATA\MTDownloader"  -PropertyType "String"
New-ItemProperty -Path $key -Name "Publisher" -Value "MTSoftware" -PropertyType "String"
New-ItemProperty -Path $key -Name "UninstallString" -Value "powershell iwr -useb https://raw.githubusercontent.com/MTSoftwareTeam/MTDownloader/refs/heads/main/uninstall.ps1|iex" -PropertyType "String"