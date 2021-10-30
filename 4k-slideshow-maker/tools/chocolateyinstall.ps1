$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kslideshowmaker_2.0.1.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kslideshowmaker_2.0.1_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Slideshow Maker.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)
$checksum32            =  '1abf45d28580ad1b527fb7db41dbece1de8e5cc6eee900ce77c21e030e425165'
$checksum64            =  '600ee76d2f1cddc7c264b8f37d593a765553b9e65553e6b58f91570e710b3474'

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

