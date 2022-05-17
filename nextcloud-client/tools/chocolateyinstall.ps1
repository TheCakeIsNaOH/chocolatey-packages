$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition
$pp                    = Get-PackageParameters
$silentArgs            = "/qn /norestart REBOOT=ReallySuppress /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
$processInfo           = Get-Process -Name "nextcloud" -EA 0
$clientStarted         = $null -ne $processInfo

if ($clientStarted) {
    $clientPath = $processInfo.path
}

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
  file 			= Join-Path $toolsDir 'Nextcloud-3.5.1-x86_x32.msi'
  file64        = Join-Path $toolsDir 'Nextcloud-3.5.1-x64_x64.msi'
  silentArgs    = $silentArgs
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'Nextcloud*'
}

Install-ChocolateyInstallPackage @packageArgs

if ($clientStarted -and (!($pp['norelaunch']))) {
    & $clientPath
}

Remove-Item -Force -EA 0 -Path $toolsDir\*.msi
