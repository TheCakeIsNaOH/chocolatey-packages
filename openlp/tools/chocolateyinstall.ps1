$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.0.1/OpenLP-3.0.1.msi'
$url64                 = 'https://get.openlp.org/3.0.1/OpenLP-3.0.1-x64.msi'
$checksum32            = 'c8d6cc1ba9b2bf44f3152cc3a3dd1881194d3e4c7dff4bb10a5df7590082caff'
$checksum64            = '547236fa7ea11924da45915b5a8b75dff06b33de5dca2581c640225cf9f28b14'

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
