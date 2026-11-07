$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://github.com/ExpressLRS/ExpressLRS-Configurator/releases/download/v1.8.4/ExpressLRS-Configurator-Setup-1.8.4.exe'
  checksum      = 'eed573884fb2ec12c8002134ff4f92e217b930f2609f3129704cf04397092162'
  checksumType  = 'sha256'
  softwareName  = 'ExpressLRS-Configurator*'
  silentArgs    = "/S /allusers"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
