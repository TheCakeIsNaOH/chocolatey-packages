$ErrorActionPreference = 'Stop'
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'Dolphin Emulator.lnk'
$extractDir            = $(Get-ToolsLocation)
$dolphinDir            = (Join-Path $extractDir Dolphin-x64)
$exepath               = (Join-Path $dolphinDir Dolphin.exe)
$url64                 = 'https://dl.dolphin-emu.org/builds/ac/9d/dolphin-master-5.0-11673-x64.7z'
$checksum64            = 'fb302f3c9c7fae6515a68629b3c64591b54f1684509d6cb63753ac33fadc0826'

$packageArgs = @{
  Url64bit       = $url64
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256'
  UnzipLocation  = $extractDir 
  PackageName    = 'dolphin'
}

Install-ChocolateyZipPackage @packageArgs

Install-BinFile -Name 'Dolphin' -Path $exepath -UseStart

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
