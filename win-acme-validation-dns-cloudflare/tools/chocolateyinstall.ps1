$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $destination
    FileFullPath   = Join-Path $toolsDir 'plugin.validation.dns.cloudflare.v2.2.6.1571.zip'
}

Get-ChocolateyUnzip @packageArgs

Remove-Item -ea 0 -force -path $toolsDir\*.zip
