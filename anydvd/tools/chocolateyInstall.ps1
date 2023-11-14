$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType	 = 'EXE'
  url            = 'https://download.redfox.bz/download/SetupAnyDVD8670.exe'
  checksum       = '24cb5beab1eb89ea69d057b35623aad5ba5e74762eb25da399e3ef037338ea3f'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
