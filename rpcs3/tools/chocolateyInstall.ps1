$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-6952be5ce495ee4887a9b1bdcba3cd3c5e992e26/rpcs3-v0.0.11-10801-6952be5c_win64.7z'
$checksum32            = '0b6922f2f46fd0e1f9f94f4360908dbf8b0fdfd88b2cd6aecfea56ccf6b9c8d9'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
