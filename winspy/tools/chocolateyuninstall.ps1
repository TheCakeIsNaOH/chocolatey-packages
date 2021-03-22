$ErrorActionPreference = 'Stop';
$shortcutName          = 'WinSpy++.lnk'
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