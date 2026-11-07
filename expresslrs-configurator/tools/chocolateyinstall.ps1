$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://github.com/ExpressLRS/ExpressLRS-Configurator/releases/download/v1.5.10/ExpressLRS-Configurator-Setup-1.5.10.exe'
  checksum      = 'a6f040768fef75ec90184e8203cc59501ab54498c17f0bba46f726ca1ec03efb'
  checksumType  = 'sha256'
  softwareName  = 'ExpressLRS-Configurator*'
  silentArgs    = "/S /allusers"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
