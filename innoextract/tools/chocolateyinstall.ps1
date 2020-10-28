$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = (Get-ChildItem $toolsDir -Filter "*.zip").FullName

Get-ChocolateyUnzip $fileLocation $toolsDir

Remove-Item -Force -EA 0 -Path $toolsDir\*.zip