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
  url64         = ''
  checksum64    = ''
  checksumType64= 'sha256'
  silentArgs    = $silentArgs
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'Nextcloud*'
}

Install-ChocolateyPackage @packageArgs

if ($clientStarted -and (!($pp['norelaunch']))) {
    & $clientPath
}

Remove-Item -Force -EA 0 -Path $toolsDir\*.msi
