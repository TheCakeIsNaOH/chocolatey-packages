$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName      = 'vcxsrv'
  fileType         = 'EXE'
  file64           = Join-Path $toolsDir '.exe'
  softwareName     = 'VcXsrv*'
  silentArgs       = '/S'
  validExitCodes   = @(0) 
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item $toolsDir\*.exe -ea 0 -Force
