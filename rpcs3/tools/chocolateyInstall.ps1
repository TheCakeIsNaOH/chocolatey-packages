$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-36f11934979659468db3ce376a8044763dab833d/rpcs3-v0.0.13-11272-36f11934_win64.7z'
$checksum32            = '5a57d18005f6b93b97623ddff7574ea31e290205707697ec00fccbd0fbdc05e3'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
