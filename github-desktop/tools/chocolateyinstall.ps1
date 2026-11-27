$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  checksumType   = 'sha256'
  silentArgs     = '-s'
  validExitCodes = @(0)
  softwareName   = 'GitHub Desktop'
  url64          = 'https://desktop.githubusercontent.com/releases/3.7.1-534cde99/GitHubDesktopSetup-x64.exe'
  checksum64     = '4d11c290f8d29c87849f48edd06e233254e924273b21c44829cfd9a05af9668f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

Start-Sleep -Seconds 60
