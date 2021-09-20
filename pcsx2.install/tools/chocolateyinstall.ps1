$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installer             = Join-Path $toolsDir 'pcsx2-1.6.0-setup.exe'
$ahkScript             = Join-Path $toolsDir 'pcsx2-install.ahk'
$pp                    = Get-PackageParameters

Write-Output "Running Autohotkey installer"
AutoHotkey $ahkScript "$installer"

Remove-Item -Force -ea 0 -Path $toolsDir\*.exe

if (!$pp['DESKTOP']) {
	$shortcut = Get-Childitem -Path ([System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)) -Filter "PCSX2 *.lnk"
    Remove-Item -ea 0 -Path $shortcut.fullname
}

$env:ChocolateyPackageInstallLocation = (Split-Path (Get-UninstallRegistryKey -SoftwareName "PCSX2*").UninstallString)