$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  FileFullPath   = Join-Path $toolsDir 'phantomjs-2.1.1-windows.zip'
  Destination    = $toolsDir
}

Get-ChocolateyUnzip @packageArgs

$null = Remove-Item "$toolsDir\*.zip" -Force -EA SilentlyContinue
