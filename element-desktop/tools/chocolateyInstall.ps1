$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  url64			 = 'https://packages.element.io/desktop/install/win32/x64/Element%20Setup%201.12.32.exe'
  checksum64     = '633a783365293916580fe8a589f3b0c8cad9e2311f45f65e2f527aa6dda72d5a'
  checksumType64 = 'sha256'
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  silentArgs     = '--silent'
  validExitCodes = @(0)
  softwareName   = 'Element' 
}

Install-ChocolateyPackage @packageArgs

Remove-Item -ea 0 -Force -Path $toolsDir\*.exe
