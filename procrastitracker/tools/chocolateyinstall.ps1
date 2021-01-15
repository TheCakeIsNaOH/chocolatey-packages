$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Remove-Process -NameFilter "procrastitracker" | Out-Null

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = Join-Path $toolsDir 'ProcrastiTracker_Setup.exe'
  softwareName  = 'ProcrastiTracker'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -EA 0 -Path $toolsDir\*.exe
