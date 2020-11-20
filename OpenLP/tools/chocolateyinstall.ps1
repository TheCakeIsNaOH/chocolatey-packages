$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'OpenLP*'
  file          = Join-Path $toolsDir 'OpenLP-2.9.1.msi'
  file64        = Join-Path $toolsDir 'OpenLP-2.9.1-x64.msi'
  FileType      = 'MSI'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -Ea 0 -Path $toolsDir\*.msi
