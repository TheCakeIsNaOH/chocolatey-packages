$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  url64			 = ''
  checksum64     = ''
  checksumType64 = 'sha256'
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  silentArgs     = '--silent'
  validExitCodes = @(0)
  softwareName   = 'Element' 
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -ea 0 -Force -Path $toolsDir\*.exe
