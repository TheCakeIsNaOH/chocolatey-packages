$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-c5aebe456411f08d7159e6a2cdfe7f3d9e6ec9b4/rpcs3-v0.0.11-10773-c5aebe45_win64.7z'
$checksum32            = 'f3a21330f961025c0cd9cfb3c11e340d4b960ba42b654b0fd0be8a12e9804ec5'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
