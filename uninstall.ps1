$desktop = [Environment]::GetFolderPath("Desktop")
remove-item -fo $Env:LOCALAPPDATA\MTDownloader -recurse
remove-item -fo "$desktop\MTDownloader.lnk" -recurse
remove-item -fo ("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\MTDownloader.lnk") -recurse
echo Usuwanie opcji odinstalowania...

$key = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MTDownloader"

# Sprawdź, czy klucz istnieje
if (Test-Path $key) {
    # Usuń cały klucz
    Remove-Item -Path $key -Recurse -Force
    echo "Klucz rejestru został usunięty."
} else {
    echo "Klucz rejestru nie istnieje."
}
