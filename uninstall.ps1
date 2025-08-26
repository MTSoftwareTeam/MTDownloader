$desktop = [Environment]::GetFolderPath("Desktop")
remove-item -fo $Env:LOCALAPPDATA\MTDownloader -recurse
remove-item -fo "$desktop\MTDownloader.lnk" -recurse
remove-item -fo ("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\MTDownloader.lnk") -recurse
echo Removing the uninstall option...

$key = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MTDownloader"

# Checking if the key exists:
if (Test-Path $key) {
    # Remove whole registry key.
    Remove-Item -Path $key -Recurse -Force
    echo "Registry key was deleted."
} else {
    echo "Registry key doesn't exist."
}
