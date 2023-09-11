$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.0rc1/OpenLP-3.1.0rc1.msi'
$url64                 = 'https://get.openlp.org/3.1.0rc1/OpenLP-3.1.0rc1-x64.msi'
$checksum32            = 'f794b5b9561a4cf3d7a16cc22af1cab9b04b4f9e4efa31cfda90f1ed8e5e8eaf'
$checksum64            = '6cdcb67ff78b673eadbe828996971ef3bf638500c3e8b6e089b75132f3c2b35c'

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
