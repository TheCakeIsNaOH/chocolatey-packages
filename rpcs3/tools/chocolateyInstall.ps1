$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-b05d12df0e54cb868047fca99afe8ae4e34dd8b6/rpcs3-v0.0.13-11204-b05d12df_win64.7z'
$checksum32            = '918f797d3302768a9e5053a954a4c1246999e65efd5229eb4a63c1a914effba3'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
