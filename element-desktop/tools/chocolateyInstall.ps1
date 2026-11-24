$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  url64			 = 'https://packages.element.io/desktop/install/win32/x64/Element%20Setup%201.12.36.exe'
  checksum64     = '1ec8cfa2c027b1ab64f0d8408fae995e9028bd123d0cc8806c9817dbc0084918'
  checksumType64 = 'sha256'
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  silentArgs     = '--silent'
  validExitCodes = @(0)
  softwareName   = 'Element' 
}

Install-ChocolateyPackage @packageArgs

Remove-Item -ea 0 -Force -Path $toolsDir\*.exe
