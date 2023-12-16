$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $toolsDir
    FileFullPath   = Join-Path $toolsDir 'GHelper.zip'
}

Get-ChocolateyUnzip @packageArgs

Remove-Item -ea 0 -force -path $toolsDir\*.zip
