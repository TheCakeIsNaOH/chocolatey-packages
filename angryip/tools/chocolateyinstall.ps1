$ErrorActionPreference = 'Stop'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = Join-Path $toolsDir 'ipscan-3.9.3-setup.exe'
  silentArgs    = '/S'
  softwareName  = 'Angry IP Scanner*' 
}
  
Install-ChocolateyInstallPackage @packageArgs
Remove-Item $toolsDir\*.exe -Force | Out-Null
Remove-Item $toolsDir\*.ignore -Force | Out-Null
