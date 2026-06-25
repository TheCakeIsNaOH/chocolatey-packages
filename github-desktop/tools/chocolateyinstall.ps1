$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  checksumType   = 'sha256'
  silentArgs     = '-s'
  validExitCodes = @(0)
  softwareName   = 'GitHub Desktop'
  url64          = 'https://github.com/desktop/desktop/releases/download/release-3.6.0/GitHubDesktopSetup-x64.exe'
  checksum64     = '56c1b848a736f9c076fb440b29d5a968fd82986ffe6ff715cb0c761c9a52f4a7'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

Start-Sleep -Seconds 60
