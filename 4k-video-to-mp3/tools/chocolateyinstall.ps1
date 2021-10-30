$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kvideotomp3_3.0.1.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kvideotomp3_3.0.1_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Video to MP3.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)
$checksum32            = '240074cd50eb52048af822dcd07db78581ceca982c5e4320f4c90ec679c1d2ad'
$checksum64            = '12299ed7c3b4a297ca94660751d8db99abc14652ae86d4fa9982c803a8517b37'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64
  softwareName  = '4K Video to MP3*'
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

