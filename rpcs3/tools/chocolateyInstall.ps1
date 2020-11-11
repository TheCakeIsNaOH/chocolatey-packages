$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-829a697c390385e2f07b358deb33bc5bc1e91540/rpcs3-v0.0.13-11222-829a697c_win64.7z'
$checksum32            = '08be4b13259026742280fdf78d2cab090df0f23237df86437efc97193cad5751'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
