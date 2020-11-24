$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipLocation = Join-Path $toolsDir 'ooregeditor.zip'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  FileFullPath   = $zipLocation
  Destination    = $toolsDir
}

Get-ChocolateyUnzip @packageArgs