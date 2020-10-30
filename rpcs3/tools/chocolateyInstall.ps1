$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-c4e89f8bb41f290e2c945a527c37601454307cb5/rpcs3-v0.0.12-11128-c4e89f8b_win64.7z'
$checksum32            = '5d1be0267d037419dc8297f1279492a93ac695962adb41df7bf4c4a55ca1a3c3'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
