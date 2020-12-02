$ErrorActionPreference = 'Stop'
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'Dolphin Emulator (Dev).lnk'
$extractDir            = $(Get-ToolsLocation)
$extractedDir          = (Join-Path $extractDir 'Dolphin-x64')
$dolphinDir            = (Join-Path $extractDir 'Dolphin-Dev')
$exepath               = (Join-Path $dolphinDir 'Dolphin.exe')

$packageArgs = @{
  FileFullPath64 = Join-Path $toolsDir 'dolphin-master-5.0-13172-x64.7z'
  Destination    = $extractDir
  PackageName    = $env:ChocolateyPackageName
}

Get-ChocolateyUnzip @packageArgs

Rename-Item -Path $extractedDir -NewName $dolphinDir -Force

Remove-Item -Force -Path $toolsDir\*.7z

Install-BinFile -Name 'Dolphin-Dev' -Path $exepath -UseStart

if ($pp['desktopicon']) {
	$desktopicon = (Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $exepath  -RunAsAdmin
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([environment]::GetFolderPath([environment+specialfolder]::Programs)) $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $exepath  -RunAsAdmin
}
