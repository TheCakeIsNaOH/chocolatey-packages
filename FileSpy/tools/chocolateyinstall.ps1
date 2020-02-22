$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'FileSpy.lnk'

$packageArgs = @{
  FileFullPath = (Join-Path $toolsDir 'filespy-4.1.0.522.zip')
  Destination  = $toolsDir
  PackageName  = 'FileSpy'
}

Get-ChocolateyUnzip @packageArgs

if (Get-OSArchitectureWidth 64) {
	Write-Host "Removing x32 files"
	Remove-Item -Recurse -Path (Join-Path $toolsDir 'Win32')
	$exepath = ([System.IO.Path]::Combine($toolsDir, 'x64', 'FileSpy.exe'))
} else {
	Write-Host "Removing x64 files"
	Remove-Item -Recurse -Path (Join-Path $toolsDir 'x64')
	$exepath = ([System.IO.Path]::Combine($toolsDir, 'Win32', 'FileSpy.exe'))
}

if ($pp['desktopicon']) {
	$desktopicon = (Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $exepath  -RunAsAdmin
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([environment]::GetFolderPath([environment+specialfolder]::Programs)) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $exepath  -RunAsAdmin
}
