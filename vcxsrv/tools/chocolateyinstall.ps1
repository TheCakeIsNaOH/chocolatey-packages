$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName      = 'vcxsrv'
  fileType         = 'EXE'
  file64           = Join-Path $toolsDir 'vcxsrv-64.21.1.16.1.installer_x64.exe'
  softwareName     = 'VcXsrv*'
  silentArgs       = '/S'
  validExitCodes   = @(0) 
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item $toolsDir\*.exe -ea 0 -Force
