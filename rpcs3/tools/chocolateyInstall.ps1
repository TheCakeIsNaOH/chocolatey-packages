$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-09a9d08466583df18925c59c8fec74f956ff0b1a/rpcs3-v0.0.13-11151-09a9d084_win64.7z'
$checksum32            = '168d938a186f408c78ace28d4ceba833c18b9658024b99afbfb46237c1dae9e0'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
