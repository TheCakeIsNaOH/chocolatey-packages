$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.0rc4/OpenLP-3.1.0rc4.msi'
$url64                 = 'https://get.openlp.org/3.1.0rc4/OpenLP-3.1.0rc4-x64.msi'
$checksum32            = '00351cfd5493191ef97448261b24f79111b954abfb544e8e3b82e9a2b3c47f2f'
$checksum64            = 'f86c429c0144fd2d109205b28954c6a5ee91133dd9ece71c2ef261e81062499c'

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
