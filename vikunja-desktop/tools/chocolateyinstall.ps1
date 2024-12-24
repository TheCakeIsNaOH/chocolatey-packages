$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  softwareName  = 'Vikunja Desktop*'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://dl.vikunja.io//desktop/0.24.6/Vikunja%20Desktop-v0.24.6.exe'
  checksum      = '189dfa4ce6968f68f5ec7cd08f0a171507902a1ca5c40a84475bb3c9322c77cf'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
