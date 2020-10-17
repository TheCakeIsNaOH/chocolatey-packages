$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-a0d95a823e0b9b6aa6d7de14b1e863ead18940a4/rpcs3-v0.0.12-11033-a0d95a82_win64.7z'
$checksum32            = 'c4252c49bc9702c4479ebda870535c59b4e043b0bd3c0ab4f3057bd6a86c697f'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
