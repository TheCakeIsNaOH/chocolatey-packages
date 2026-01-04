$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$destination           = Join-Path $(Get-ToolsLocation) 'kiwix-desktop'
$exepath               = (Join-Path $destination 'kiwix-desktop.exe')

$packageArgs = @{
    FileFullPath64 = Join-Path $toolsDir 'kiwix-desktop_windows_x64_2.5.1.zip'
}

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName $packageArgs.FileFullPath64

Uninstall-BinFile -Name 'kiwix-desktop' -Path $exepath
