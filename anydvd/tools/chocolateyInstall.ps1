$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType	 = 'EXE'
  url            = 'https://download.redfox.bz/download/SetupAnyDVD8700.exe'
  checksum       = '3c77a3f0f974cba4e8c5d7f5b7dfd0bc61b07ac6e825be48a343efbe03ff0a79'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
