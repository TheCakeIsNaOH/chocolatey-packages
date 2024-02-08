$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = Join-Path $toolsDir 'HexChat-2.16.2_x32.exe'
  file64        = Join-Path $toolsDir 'HexChat-2.16.2_x64.exe'
  softwareName  = 'hexchat*'
  silentArgs    = "/SILENT"
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -EA 0 -Path $toolsDir\*.exe
