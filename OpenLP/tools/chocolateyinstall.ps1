$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/2.9.0/OpenLP-2.9.0-x64.msi'
$url64                 = 'https://get.openlp.org/2.9.0/OpenLP-2.9.0.msi'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'OpenLP*'
  url           = $url32
  url64bit      = $url64
  FileType      = 'MSI'
  checksum      = '13975bec5adb4f1bf051801ac3a0ba332f270368c48e75a8d68d613b655223c9'
  checksumType  = 'sha256' 
  checksum64    = 'f80180ee0e0e52249e8bb12f8f88364631b5b935959e643037a64a428fa1f33d'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs