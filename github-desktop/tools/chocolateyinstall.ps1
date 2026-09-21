$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  checksumType   = 'sha256'
  silentArgs     = '-s'
  validExitCodes = @(0)
  softwareName   = 'GitHub Desktop'
  url64          = 'https://desktop.githubusercontent.com/releases/3.6.6-8b85519e/GitHubDesktopSetup-x64.exe'
  checksum64     = 'b01f33ffaaf5febe399eef8bdf72444e38d580c3530c05fc35eae166596227a2'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

Start-Sleep -Seconds 60
