$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = Join-Path $toolsDir 'DOSBox0.74-3-win32-installer.exe'
  silentArgs    = '/S'
  softwareName  = 'DosBox*'
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -EA 0 -Path $toolsDir\*.exe
