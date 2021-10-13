$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kslideshowmaker_2.0.0.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kslideshowmaker_2.0.0_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Slideshow Maker.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)
$checksum32            =  'fd879c568f12e83472accdaacc1f8b36a65f2af881c6b348d2446f2f85268864'
$checksum64            =  '4f7c198db3efd0dfd4e63ee88d2e256b75caa9a308b07029c8197470cf4bd689'

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

