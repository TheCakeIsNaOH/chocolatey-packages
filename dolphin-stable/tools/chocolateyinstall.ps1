$ErrorActionPreference = 'Stop'
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'Dolphin.lnk'
$dolphinFolder         = (Join-Path ([System.Environment]::GetFolderPath("ProgramFiles")) 'Dolphin')
$exePath               = Join-Path $dolphinFolder  'Dolphin.exe'
$shortcut              = Join-Path ([System.Environment]::GetFolderPath("CommonDesktop")) $shortcutName
$startFolder           = Join-Path ([System.Environment]::GetFolderPath("CommonPrograms")) 'Dolphin'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file           = Join-Path $toolsDir 'dolphin-x64-5.0.exe'
  softwareName   = 'Dolphin*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -Path $toolsDir\*.exe

Install-BinFile -Name 'Dolphin-Stable' -Path $exepath -UseStart

if (!($pp['desktopicon'])) {
    Write-Host -ForgroundColor white "Removing $shortcut"
    Remove-Item -Force -Ea 0 -Path $shortcut 
}

if ($pp['nostart']) {
	Write-Host -ForegroundColor white "Removeing  $startFolder"
	Remove-Item -Force -Ea 0 -Path $startFolder
}