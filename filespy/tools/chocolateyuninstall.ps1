$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutName          = 'FileSpy.lnk'
$desktopicon           = (Join-Path ([System.Environment]::GetFolderPath('Desktop')) $shortcutName)
$starticon             = (Join-Path ([System.Environment]::GetFolderPath('Programs')) $shortcutName)

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