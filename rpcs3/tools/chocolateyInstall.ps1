$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = $env:ChocolateyPackageName
    Destination  = $toolsDir
    FileFullPath = Join-Path $toolsDir 'rpcs3-v0.0.13-11275-85880ffd_win64.7z'
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "$packageName installed to $toolsDir"

Remove-Item -Force -Path $toolsDir\*.zip
