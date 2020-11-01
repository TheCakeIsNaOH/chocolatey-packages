$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-46d3066c6294a738a51eb7b344047a705de4710c/rpcs3-v0.0.12-11148-46d3066c_win64.7z'
$checksum32            = '6d8872587932fbf084e88cfd6eb582e25f296dcf992748c31c5fe135b303622d'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
