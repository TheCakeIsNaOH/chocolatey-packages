$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.0.2/OpenLP-3.0.2.msi'
$url64                 = 'https://get.openlp.org/3.0.2/OpenLP-3.0.2-x64.msi'
$checksum32            = '8202078d1b54cb3f6daf4456beb44d450cd6801f338ee2a9c6ed204945de4d0b'
$checksum64            = 'efdf30590d267acee881262123f3ef389fb3fe9cc55b258763105755a6342948'

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
