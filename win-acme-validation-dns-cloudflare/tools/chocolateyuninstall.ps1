$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    FilePath   = 'win-acme.v2.2.6.1571.x86.pluggable.zip'
}

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName $packageArgs.FilePath