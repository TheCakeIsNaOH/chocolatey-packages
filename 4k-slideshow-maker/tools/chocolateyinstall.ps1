$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kslideshowmaker_1.8.1.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kslideshowmaker_1.8.1_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Slideshow Maker.lnk'
$shortcut              = Join-Path ([System.Environment]::GetFolderPath("Desktop")) $shortcutName
$checksum32            =  'f61cb1adf76a45d1cde2d7ab307d08acbddd630d4d8f14962a4fc7f5d8b6ae6b'
$checksum64            =  '9127ccf7a5145df36c84920bbe2779915dfdaf35c014c5c9952e0d831dbcb2f4'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64
  softwareName  = '4K Slideshow Maker*'
  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

if ($pp['noicon']) {
	if (Test-Path $shortcut) {
		Remove-Item $shortcut
		Write-Host -ForegroundColor green 'Removed ' $shortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $shortcut
	}
}

