$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  url64			 = 'https://packages.element.io/desktop/install/win32/x64/Element%20Setup%201.12.35.exe'
  checksum64     = '8064db8e9b2a5eff871b56ef063af4fc751f1058344f108285c33a9bb97ba994'
  checksumType64 = 'sha256'
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  silentArgs     = '--silent'
  validExitCodes = @(0)
  softwareName   = 'Element' 
}

Install-ChocolateyPackage @packageArgs

Remove-Item -ea 0 -Force -Path $toolsDir\*.exe
