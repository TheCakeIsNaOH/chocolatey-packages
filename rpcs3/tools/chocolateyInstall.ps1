$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-8a50880613af0eadebb6822a52cefae74e43098b/rpcs3-v0.0.13-11205-8a508806_win64.7z'
$checksum32            = '868432598445a8c705fd06f669474dc1a08ef1085f08d3f9f26102d3ce259772'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
