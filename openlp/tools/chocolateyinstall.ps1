$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.4/OpenLP-3.1.4.msi'
$url64                 = 'https://get.openlp.org/3.1.4/OpenLP-3.1.4-x64.msi'
$checksum32            = '4d59c352923684d2e3908054e8a59eb3c1e407e143313296b3ad4221da09462d'
$checksum64            = 'f711b189d17f2e18f04024f0c9b981435b4692227064f758e2e74decc3f0f903'

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
