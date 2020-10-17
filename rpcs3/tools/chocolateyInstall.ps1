$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-6590366f8e4f0d096f6cda7535c76a96d8f45495/rpcs3-v0.0.12-11039-6590366f_win64.7z'
$checksum32            = '97c4cf70e54da55cf542e8f9224d731975de11f5e5e16366a3d365e2497576bf'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
