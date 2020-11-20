$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-5b207c3b9566d02e0f687398566efe10f825fc7f/rpcs3-v0.0.13-11274-5b207c3b_win64.7z'
$checksum32            = '35383065607e2fc70c2c270fd103b3d2ced6a1a28e091c688708d7e2fd970c12'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
