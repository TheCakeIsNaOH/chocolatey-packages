﻿$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    FilePath   = 'win-acme.v0.0.0.0.x86.trimmed.zip'
    FilePath64 = 'win-acme.v0.0.0.0.x64.trimmed.zip'
}

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName $packageArgs.FilePath
Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName $packageArgs.FilePath64

Uninstall-BinFile -Name 'wacs'
