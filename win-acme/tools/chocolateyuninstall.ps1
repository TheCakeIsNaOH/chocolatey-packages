$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$destination           = Join-Path $(Get-ToolsLocation) 'win-acme'
$exepath               = (Join-Path $destination 'wacs.exe')

$packageArgs = @{
    FilePath   = 'win-acme.v2.2.9.1680.x86.pluggable.zip'
    FilePath64 = 'win-acme.v2.2.9.1680.x64.pluggable.zip'
}

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName $packageArgs.FilePath
Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName $packageArgs.FilePath64

Uninstall-BinFile -Name 'wacs' -Path $exepath
