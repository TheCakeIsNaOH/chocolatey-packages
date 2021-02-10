$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'RPCS3.lnk'
$extractDir            = $(Get-ToolsLocation)
$rpcs3Dir              = (Join-Path $extractDir 'RPCS3')
$exepath               = (Join-Path $rpcs3Dir 'rpcs3.exe')

$packageArgs = @{
    PackageName  = $env:ChocolateyPackageName
    Destination  = $rpcs3Dir
    FileFullPath = Join-Path $toolsDir 'rpcs3-v0.0.14-11736-195fb1cf_win64.7z'
}

Write-Host "Moving existing files from $toolsDir to rpcs3Dir"
Mkdir -Force -Ea 0 -Path $rpcs3Dir  | Out-Null
Get-ChildItem -Directory -Path $toolsDir | Move-Item -Destination $rpcs3Dir
Get-ChildItem -Exclude "*.7z","*.ps1" -Path $toolsDir | Move-Item -Destination $rpcs3Dir

Get-ChocolateyUnzip @packageArgs

Write-Host "$packageName installed to $rpcs3Dir"

Remove-Item -Force -Path $toolsDir\*.7z

Install-BinFile -Name 'RPCS3' -Path $exepath -UseStart

if ($pp['desktopicon']) {
	$desktopicon = (Join-Path ([Environment]::GetFolderPath("CommonDesktop")) $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $exepath  -RunAsAdmin
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([environment]::GetFolderPath([environment+specialfolder]::CommonPrograms)) $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $exepath  -RunAsAdmin
}
