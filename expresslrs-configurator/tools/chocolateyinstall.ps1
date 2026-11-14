$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://github.com/ExpressLRS/ExpressLRS-Configurator/releases/download/v1.8.5/ExpressLRS-Configurator-Setup-1.8.5.exe'
  checksum      = '820b147bd8b94f5d36871498b9a49f566baa24c95ddbc1b0d7f7d158affe783b'
  checksumType  = 'sha256'
  softwareName  = 'ExpressLRS-Configurator*'
  silentArgs    = "/S /allusers"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
