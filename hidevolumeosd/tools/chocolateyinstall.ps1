$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file           = Join-Path $toolsDir 'HideVolumeOSD-1.4.exe'
  softwareName   = 'HideVolumeOSD*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

$null = Remove-Process -NameFilter "HideVolumeOSD"

Install-ChocolateyInstallPackage @packageArgs

Remove-Item "$toolsDir\*.exe" -Force -EA SilentlyContinue | Out-Null