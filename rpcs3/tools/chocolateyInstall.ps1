$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-28cbba5a7d6e12b58c92e14f309cc7c40fb48f95/rpcs3-v0.0.13-11265-28cbba5a_win64.7z'
$checksum32            = '4ef03b94d97120418a4d3d4b3b45d818b7f4989f66fc208933681359a52cd2ac'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
