$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-0c7f9458c0bc81dc2b07f50bb84d3e0c0d1889d2/rpcs3-v0.0.13-11240-0c7f9458_win64.7z'
$checksum32            = 'ba61eb88f6e8bfd45da2625c756d998029d347bef0ecce87f003e49a43f5cf9d'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
