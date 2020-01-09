$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$extractDir            = (Join-Path $(Get-ToolsLocation) Dolphin)
$exepath               = (Join-Path $extractDir Dolphin.exe)
$shortcutName          = 'Dolphin.exe'
$desktopicon           = (Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName)
$starticon             = (Join-Path ([environment]::GetFolderPath([environment+specialfolder]::Programs)) $shortcutName)


if (Test-Path $desktopicon) {
	Remove-Item $desktopicon
	Write-Host -ForegroundColor green 'Removed ' $desktopicon
} else {
	Write-Host -ForegroundColor yellow 'Did not find ' $desktopicon
}

if (Test-Path $starticon) {
	Remove-Item $starticon
	Write-Host -ForegroundColor green 'Removed ' $starticon
} else {
	Write-Host -ForegroundColor yellow 'Did not find ' $starticon ' to remove'
}

Uninstall-BinFile -Name 'Dolphin' -Path $exepath


#delete files? files included and some folders?