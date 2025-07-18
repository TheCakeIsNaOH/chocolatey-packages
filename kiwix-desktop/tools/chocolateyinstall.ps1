﻿$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
$destination           = Join-Path $(Get-ToolsLocation) 'kiwix-desktop'
$exepath               = (Join-Path $destination 'kiwix-desktop.exe')

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    FileFullPath64 = Join-Path $toolsDir 'kiwix-desktop_windows_x64_2.4.1.zip'
    destination    = $destination
}

Get-ChocolateyUnzip @packageArgs

Install-BinFile -Name 'kiwix-desktop' -Path $exepath

Remove-Item -ea 0 -force -path $toolsDir\*.zip
