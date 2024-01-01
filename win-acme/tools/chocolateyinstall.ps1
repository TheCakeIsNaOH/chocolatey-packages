$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
$destination           = Join-Path $(Get-ToolsLocation) 'win-acme'
$exepath               = (Join-Path $destination 'wacs.exe')

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $destination
    FileFullPath   = Join-Path $toolsDir 'win-acme.v2.2.6.1571.x86.pluggable.zip'
    FileFullPath64 = Join-Path $toolsDir 'win-acme.v2.2.6.1571.x64.pluggable.zip'
}

Get-ChocolateyUnzip @packageArgs

Install-BinFile -Name 'wacs' -Path $exepath

Remove-Item -ea 0 -force -path $toolsDir\*.zip
