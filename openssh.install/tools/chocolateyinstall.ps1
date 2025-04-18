$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  file          = Join-Path $toolsDir 'OpenSSH-ARM64-v9.8.3.0.msi'
  file64        = Join-Path $toolsDir 'OpenSSH-Win64-v9.8.3.0.msi'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'OpenSSH*'
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -EA 0 -Path $toolsDir\*.msi
