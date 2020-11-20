$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'RPCS3.lnk'
$extractDir            = $(Get-ToolsLocation)
$extractedDir          = (Join-Path $extractDir 'Dolphin-x64')
$dolphinDir            = (Join-Path $extractDir 'Dolphin-Dev')
$exepath               = (Join-Path $dolphinDir 'Dolphin.exe')

$packageArgs = @{
    PackageName  = $env:ChocolateyPackageName
    Destination  = $toolsDir
    FileFullPath = Join-Path $toolsDir 'rpcs3-v0.0.13-11280-5f010c2f_win64.7z'
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsDir"

Remove-Item -Force -Path $toolsDir\*.7z
