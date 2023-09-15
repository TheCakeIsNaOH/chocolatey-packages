$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.0rc2/OpenLP-3.1.0rc2.msi'
$url64                 = 'https://get.openlp.org/3.1.0rc2/OpenLP-3.1.0rc2-x64.msi'
$checksum32            = '0862c354746348ca1b33d2a75eeb74c73dade982670e73196cafde92e0520f23'
$checksum64            = '3ba642e4203ac4adb55e62a89854889fe87cbad7fd0acb4a28bc0d5a74a9cd17'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'OpenLP*'
  FileType      = 'MSI'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
  url64bit      = $url64
  checksum64    = $checksum64
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs
