$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  checksumType   = 'sha256'
  silentArgs     = '-s'
  validExitCodes = @(0)
  softwareName   = 'GitHub Desktop'
  url64          = 'https://desktop.githubusercontent.com/releases/3.6.7-dbc92f97/GitHubDesktopSetup-x64.exe'
  checksum64     = '2e38db8d986884474a1e45afddf554a7187f42124bd38a3d7ea165be7f77f90d'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

Start-Sleep -Seconds 60
