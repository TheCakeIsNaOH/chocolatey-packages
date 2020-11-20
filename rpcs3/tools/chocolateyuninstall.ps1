$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$extractDir            = $(Get-ToolsLocation)
$rpcs3Dir              = (Join-Path $extractDir 'RPCS3')
$exepath               = (Join-Path $rpcs3Dir 'rpcs3.exe')
$shortcutName          = 'RPCS3.lnk'
$desktopicon           = (Join-Path ([Environment]::GetFolderPath("CommonDesktop")) $shortcutName)
$starticon             = (Join-Path ([environment]::GetFolderPath([environment+specialfolder]::CommonPrograms)) $shortcutName)


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

Write-Host -ForegroundColor white 'Removing ' $rpcs3Dir
Remove-Item $rpcs3Dir -Recurse -ea 0