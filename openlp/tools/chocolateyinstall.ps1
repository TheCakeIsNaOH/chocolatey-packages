$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/2.9.2/OpenLP-2.9.2.msi'
$url64                 = 'https://get.openlp.org/2.9.2/OpenLP-2.9.2-x64.msi'
$checksum32            = '1c7eb29b07a8593f110433b87898c5bacef43e369f3bcdba251157645aff51e6'
$checksum64            = '76b858396fd0dc3350dd1c2d22079ef187e678de0e064c8a80f4a43daa881938'

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
