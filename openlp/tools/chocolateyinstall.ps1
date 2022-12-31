$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.0.0/OpenLP-3.0.0.msi'
$url64                 = 'https://get.openlp.org/3.0.0/OpenLP-3.0.0-x64.msi'
$checksum32            = '1fe655b088c0396f867a4d72f76f4d75a1b12159cb4715590a37e344dee2f3d7'
$checksum64            = '98a064003f2d5d49ddcf52ed93204178a50a4591588db6df26f5ad7a398520e3'

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
