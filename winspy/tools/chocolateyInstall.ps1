$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath               = Join-Path $toolsDir "WinSpy.exe"
$pp                    = Get-PackageParameters
$shortcutName          = 'WinSpy++.lnk'

$packageArgs = @{
  FileFullPath64 = Join-Path $toolsDir 'WinSpy17.zip'
  Destination    = $toolsDir
  PackageName    = $env:ChocolateyPackageName
}

Get-ChocolateyUnzip @packageArgs

Set-Content -Path ("$exePath.gui") -Value $null

if ($pp['desktopicon']) {
	$desktopicon = (Join-Path ([System.Environment]::GetFolderPath('Desktop'))) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $exePath
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([System.Environment]::GetFolderPath('Programs')) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $exePath
}