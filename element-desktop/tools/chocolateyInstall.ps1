$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  url64			 = 'https://packages.element.io/desktop/install/win32/x64/Element%20Setup%201.12.34.exe'
  checksum64     = '9e2c55cb5e9d42d5e2b558de0dfde735e371380b9eecf3d716aaa5703e75817c'
  checksumType64 = 'sha256'
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  silentArgs     = '--silent'
  validExitCodes = @(0)
  softwareName   = 'Element' 
}

Install-ChocolateyPackage @packageArgs

Remove-Item -ea 0 -Force -Path $toolsDir\*.exe
