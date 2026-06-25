$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  checksumType   = 'sha256'
  silentArgs     = '-s'
  validExitCodes = @(0)
  softwareName   = 'GitHub Desktop'
  url64          = 'https://github.com/desktop/desktop/releases/download/release-3.6.1/GitHubDesktopSetup-x64.exe'
  checksum64     = '2e0a3519ba3d4bdbb7cbdec0e2605535e78cb81f4051e3c963cf3a613af5ebca'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs

Start-Sleep -Seconds 60
