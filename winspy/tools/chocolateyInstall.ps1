$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$extractedExe          = Join-Path $toolsDir "WinSpy.exe"
$pp                    = Get-PackageParameters
$shortcutName          = 'WinSpy++.lnk'

$packageArgs = @{
  FileFullPath64 = Join-Path $toolsDir 'WinSpy17.zip'
  Destination    = $toolsDir
  PackageName    = $env:ChocolateyPackageName
}

Get-ChocolateyUnzip @packageArgs

Set-Content -Path ("$extractedExe.gui") -Value $null

if ($pp['desktopicon']) {
	$desktopicon = (Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $exepath
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([environment]::GetFolderPath([environment+specialfolder]::Programs)) $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $exepath
}