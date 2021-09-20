$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'FileSpy.lnk'
$url                   = 'http://www.zezula.net/download/filespy.zip'

$packageArgs = @{
  Url           = $url
  Checksum      = '039e377cbf689f49f3641306001236c09128fb10eef671513b37aa7e8d5b024c'
  ChecksumType  = 'sha256'
  UnzipLocation = $toolsDir
  PackageName   = 'FileSpy'
}

Install-ChocolateyZipPackage @packageArgs

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
	$desktopicon = (Join-Path ([System.Environment]::GetFolderPath('Desktop')) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $exepath  -RunAsAdmin
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([System.Environment]::GetFolderPath('Programs')) $shortcutName)
	Write-Host -ForegroundColor green 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $exepath  -RunAsAdmin
}
