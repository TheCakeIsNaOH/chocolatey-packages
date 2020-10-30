$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition
$pp                    = Get-PackageParameters
$silentArgs            = "/qn /norestart REBOOT=ReallySuppress "

if (!($pp['icon'])) {
    $silentArgs += 'NO_DESKTOP_SHORTCUT="1" '
}

if (!($pp['KeepUpdateCheck'])) {
    $silentArgs += 'SKIPAUTOUPDATE="1" '
}

if ($pp['NoStart']) {
    $silentArgs += 'NO_START_MENU_SHORTCUTS="1" '
}

if ($pp['NoShell']) {
    $silentArgs += 'NO_SHELL_EXTENSIONS="1" '
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  file 			= Get-Item $toolsDir\*_x32.msi
  file64        = Get-Item $toolsDir\*_x64.msi
  silentArgs    = $silentArgs
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'Nextcloud Desktop*'
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -EA 0 -Path $toolsDir\*.msi