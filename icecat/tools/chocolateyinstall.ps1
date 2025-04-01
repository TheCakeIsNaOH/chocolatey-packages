$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp = Get-PackageParameters
$silentArgs = '/S'

if (!$pp['PreventRebootRequired']) {
  $pp['PreventRebootRequired'] = 'true'
}

$pp.GetEnumerator() | ForEach-Object {
  $silentArgs += " /$($_.Name)=$($_.Value)"
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file64         = Join-Path $toolsDir 'icecat-115.22.0.en-US.win64.installer_x64.exe'
  silentArgs     = $silentArgs
  validExitCodes = @(0)
  softwareName   = 'Icecat*'
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
