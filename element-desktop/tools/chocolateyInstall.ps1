$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  url64			 = 'https://packages.element.io/desktop/install/win32/x64/Element%20Setup%201.12.33.exe'
  checksum64     = '9ce1ba82ef244cd3b26333d0673769641676fa3c5477ea8c388ed11f42ed7c20'
  checksumType64 = 'sha256'
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  silentArgs     = '--silent'
  validExitCodes = @(0)
  softwareName   = 'Element' 
}

Install-ChocolateyPackage @packageArgs

Remove-Item -ea 0 -Force -Path $toolsDir\*.exe
