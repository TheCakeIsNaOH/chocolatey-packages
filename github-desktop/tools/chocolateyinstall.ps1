$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  checksumType   = 'sha256'
  silentArgs     = '-s'
  validExitCodes = @(0)
  softwareName   = 'GitHub Desktop'
  url64          = 'https://desktop.githubusercontent.com/releases/3.7.0-f13859b6/GitHubDesktopSetup-x64.exe'
  checksum64     = '2e49e219c6f6e06fedeb2a7a14d357bf43b701efe29ad6963e84cf326b1c9fca'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

Start-Sleep -Seconds 60
