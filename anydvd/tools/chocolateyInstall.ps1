$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType	 = 'EXE'
  url            = 'https://download.redfox.bz/download/SetupAnyDVD8680.exe'
  checksum       = '99b50649cda5dc0c6140ef790ce02a61ce77aa0a79ce929a1e34149ffde2509a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
