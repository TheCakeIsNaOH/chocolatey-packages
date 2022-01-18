$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/2.9.4/OpenLP-2.9.4.msi'
$url64                 = 'https://get.openlp.org/2.9.4/OpenLP-2.9.4-x64.msi'
$checksum32            = '6b4c5dfc35c3f7fba76bf6e09f7fa18498d38bf522ba2993735c44ff2c43da96'
$checksum64            = 'a707b9ef27b5eb5fd516bd5e9001d26cca0fce06d5a8dddae153cead6992eb76'

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
