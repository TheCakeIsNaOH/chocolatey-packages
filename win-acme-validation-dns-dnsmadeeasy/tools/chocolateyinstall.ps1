$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
$destination           = Join-Path $(Get-ToolsLocation) 'win-acme'

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $destination
    FileFullPath   = Join-Path $toolsDir 'plugin.validation.dns.dnsmadeeasy.v2.2.8.1635.zip'
}

Get-ChocolateyUnzip @packageArgs

Remove-Item -ea 0 -force -path $toolsDir\*.zip
