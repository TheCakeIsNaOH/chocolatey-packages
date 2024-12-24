$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  softwareName  = 'Vikunja Desktop*'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://dl.vikunja.io/'
  checksum      = '1234'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs