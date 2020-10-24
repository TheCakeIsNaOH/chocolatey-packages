$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-27643cb715e511e091182fbb0ce3d077ffea28d4/rpcs3-v0.0.12-11068-27643cb7_win64.7z'
$checksum32            = 'b270738893769e871481be1dbbab2df843be97dc60568c7782828cb4bf7213ff'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
