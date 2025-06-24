$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$destination           = Join-Path $(Get-ToolsLocation) 'kiwix-desktop'
$exepath               = (Join-Path $destination 'kiwix-desktop.exe')

$packageArgs = @{
    FileFullPath64 = ''
}

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName $packageArgs.FileFullPath64

Uninstall-BinFile -Name 'kiwix-desktop' -Path $exepath
