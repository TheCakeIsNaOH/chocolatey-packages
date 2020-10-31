$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-a42663b09bcfa8fc7d20d272c2451e65220b036a/rpcs3-v0.0.12-11142-a42663b0_win64.7z'
$checksum32            = '22b892c275e6a0d907f084c4b9afe12697e7c94f5a54fd43467cf5c121263a96'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
