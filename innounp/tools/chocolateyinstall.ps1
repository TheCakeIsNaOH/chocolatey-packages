$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$fileFullPath          = (Join-Path $toolsDir 'innounp.exe')
$shortcutName          = 'innounp.lnk'

if ($pp['desktop']) {
	$desktopicon = (Join-Path ([System.Environment]::GetFolderPath('Desktop')) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $fileFullPath  -RunAsAdmin
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([System.Environment]::GetFolderPath('Programs')) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $fileFullPath  -RunAsAdmin
}