$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-68931b4c431761cbbeba79bdc4fa3aa248900711/rpcs3-v0.0.13-11263-68931b4c_win64.7z'
$checksum32            = '5bdfeb8ccba8ea35f00540daede847c96e211ad06bbbdaed254b95a0e4515ddc'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
