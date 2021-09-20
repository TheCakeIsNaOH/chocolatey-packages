$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutName          = 'PCSX2 (Dev).lnk'
$startPath             = Join-Path ([System.Environment]::GetFolderPath("CommonStartMenu")) $shortcutName
$desktopPath           = Join-Path ([System.Environment]::GetFolderPath("CommonDesktop")) $shortcutName
$installpathfile       = Join-Path $toolsDir 'install-files.txt'


Remove-Item -ea 0 -Force -Path $startPath 
Remove-Item -ea 0 -Force -Path $desktopPath 

If (Test-Path $installpathfile) {
	$fileList = Get-Content -Path $installpathfile
	$fileList | Where-Object { $_ -NotMatch "Plugins|Shaders" } | Remove-Item -Recurse -Force -ea 0
	Write-Output "Configuration and other user created files left at install location"
	Write-Output "Default install location is in Chocolatey tools directory, defaults to C:\tools\pcsx2"
} else {
	Write-Warning "Cannot find files to uninstall, they may need to removed manually"
	Write-Warning "Default install location is in Chocolatey tools directory, defaults to C:\tools\pcsx2"
}

