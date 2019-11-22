$fileName     = 'ReflectDL.exe'
$softwareName = 'Macrium Reflect Installer'
$toolsPath    = "$env:systemdrive\tools"
$filePath     = "$toolsPath\$fileName"
$packageArgs  = @{
  packageName             = 'reflect-free'
  url                     = 'http://updates.macrium.com/reflect/v6/ReflectDL.exe'
}

Get-WebFile "$($packageArgs.url)" "$filePath"

# Shortcut
$desktop = [System.Environment]::GetFolderPath('Desktop')
$startMenu = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::StartMenu)
Install-ChocolateyShortcut -ShortcutFilePath "$desktop\$softwareName.lnk" -TargetPath "$filePath"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenu\Programs\$softwareName.lnk" -TargetPath "$filePath"

# Warn about unfinished business
Write-Host
Write-Host "The installer could not be automated." -ForegroundColor "White"
Write-Host "We've placed a link to the installer on your Desktop." -ForegroundColor "White"
Write-Host "You can manually run this installer at your earliest convenience." -ForegroundColor "White"
Write-Host
