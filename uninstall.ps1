$desktop = [Environment]::GetFolderPath("Desktop")
remove-item -fo $Env:LOCALAPPDATA\MTDownloader -recurse
remove-item -fo "$desktop\MTDownloader.lnk" -recurse
remove-item -fo ("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\MTDownloader.lnk") -recurse
