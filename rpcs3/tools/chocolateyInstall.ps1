$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'RPCS3.lnk'
$extractDir            = $(Get-ToolsLocation)
$rpcs3Dir              = (Join-Path $extractDir 'RPCS3')
$exepath               = (Join-Path $rpcs3Dir 'rpcs3.exe')

$packageArgs = @{
    PackageName  = $env:ChocolateyPackageName
    Destination  = $toolsDir
    FileFullPath = Join-Path $toolsDir 'rpcs3-v0.0.13-11280-5f010c2f_win64.7z'
}

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