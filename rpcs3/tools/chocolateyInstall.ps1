$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-52fa69d93de821734e675e1eb6de2c49f03043d8/rpcs3-v0.0.13-11216-52fa69d9_win64.7z'
$checksum32            = '66e30d168685d2175e30a06618db517739356509058256f95f1e0c136bbe49d7'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
