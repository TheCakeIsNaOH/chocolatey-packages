$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file64         = Join-Path $toolsDir 'pcsx2-v2.4.0-windows-x64-installer.exe'
  softwareName   = 'PCSX2*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item "$toolsDir\*.exe" -Force -EA SilentlyContinue | Out-Null

if (!$pp['DESKTOP'] -or $pp['DesktopShortcut']) {
    $shortcutName = "PCSX2.lnk"
	$shortcut = ([System.IO.Path]::Combine(([System.Environment]::GetFolderPath("CommonDesktop")), $shortcutName))
    Remove-Item -ea 0 -Path $shortcut
}
