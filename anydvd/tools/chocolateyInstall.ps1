$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType	 = 'EXE'
  url            = 'https://download.redfox.bz/download/SetupAnyDVD8710.exe'
  checksum       = 'b8095c1508abbf52f7e01c802021dfdf15e5017d8ed8a852049912f6eaf41ab7'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
