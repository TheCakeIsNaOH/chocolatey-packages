$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$dolphinDir            = (Join-Path $(Get-ToolsLocation) Dolphin-Beta)
$exepath               = (Join-Path $dolphinDir Dolphin.exe)
$shortcutName          = 'Dolphin Emulator (Beta).lnk'
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

Uninstall-BinFile -Name 'Dolphin-Beta' -Path $exepath

Write-Host -ForegroundColor red "Not removing $rpcs3Dir so as to not remove user data, it can be removed manually"