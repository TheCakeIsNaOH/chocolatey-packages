$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$dolphinDir            = (Join-Path $(Get-ToolsLocation) Dolphin-x64)
$exepath               = (Join-Path $dolphinDir Dolphin.exe)
$shortcutName          = 'Dolphin Emulator.lnk'
$desktopicon           = (Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName)
$starticon             = (Join-Path ([environment]::GetFolderPath([environment+specialfolder]::Programs)) $shortcutName)


if (Test-Path $desktopicon) {
	Remove-Item $desktopicon
	Write-Host -ForegroundColor white 'Removed ' $desktopicon
} else {
	Write-Host -ForegroundColor yellow 'Did not find ' $desktopicon 'to remove'
}

if (Test-Path $starticon) {
	Remove-Item $starticon
	Write-Host -ForegroundColor white 'Removed ' $starticon
} else {
	Write-Host -ForegroundColor yellow 'Did not find ' $starticon 'to remove'
}

Uninstall-BinFile -Name 'Dolphin' -Path $exepath

Write-Host -ForegroundColor white 'Removing ' $dolphinDir
Remove-Item $DolphinDir -Recurse -ea 0