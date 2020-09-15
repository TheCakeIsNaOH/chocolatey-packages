$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kvideotomp3_2.6.1.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kvideotomp3_2.6.1_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Video to MP3.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName
$checksum32            = 'c1f82ba687632fd615904b0ac8d3a4d6679fe4da3fb818cc52a807c7967307c9'
$checksum64            = 'dcac4b38e766458a67d9184d0607c45f3e06c95f9259e7eb541134bd2422982c'

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

