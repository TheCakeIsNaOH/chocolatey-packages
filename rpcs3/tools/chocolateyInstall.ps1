$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-b1710bb7125012d513e2cd5040db2cea05a6d2aa/rpcs3-v0.0.13-11249-b1710bb7_win64.7z'
$checksum32            = 'dfbfe688c91f9b9bd44dd326466df9cc7ea8529930996298f9559ea72c410b5d'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
