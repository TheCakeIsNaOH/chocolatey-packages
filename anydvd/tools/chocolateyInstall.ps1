$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType	 = 'EXE'
  url            = 'https://download.redfox.bz/download/SetupAnyDVD8650.exe'
  checksum       = 'd9b283d4e8e9542de46150425a77bec4c768ce836d1d438882fa70c21ed7b7d9'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
