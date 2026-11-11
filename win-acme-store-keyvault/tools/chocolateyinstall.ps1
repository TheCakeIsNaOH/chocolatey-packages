$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
$destination           = Join-Path $(Get-ToolsLocation) 'win-acme'

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $destination
    FileFullPath   = Join-Path $toolsDir 'plugin.store.keyvault.v2.4.1.2444.zip'
}

Get-ChocolateyUnzip @packageArgs

Remove-Item -ea 0 -force -path $toolsDir\*.zip
