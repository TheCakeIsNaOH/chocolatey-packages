$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-1378645413c291ad18e5d18b6d919b366507f9d8/rpcs3-v0.0.13-11232-13786454_win64.7z'
$checksum32            = 'f972cf1702d0606cee947675023e68066278b25cf4154471757e256529384fc1'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
