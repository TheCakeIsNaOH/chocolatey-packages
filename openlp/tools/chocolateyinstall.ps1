$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/2.9.3/OpenLP-2.9.3.msi'
$url64                 = 'https://get.openlp.org/2.9.3/OpenLP-2.9.3-x64.msi'
$checksum32            = '810a9835e85769e7b5bc45c467fdc467757e18b2acd6a50cd678a739cc29a82b'
$checksum64            = '1797e820924a857477cb633ac13faaf421239890e6bdb9cdc77cea5377635a18'

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
