$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-a90801e2aa2d77ab369a087529d6199257692f13/rpcs3-v0.0.12-11042-a90801e2_win64.7z'
$checksum32            = 'c0f4ddf05b9a44aa2af797e3e7b2b72d7bab2e27fb0032aa4f4a68c42b0ed608'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
