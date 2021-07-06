$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = Join-Path $toolsDir 'innoextract-1.9-windows.zip'
  Destination   = $toolsDir
}

Get-ChocolateyUnzip @packageArgs

Remove-Item -Force -EA 0 -Path $toolsDir\*.zip
