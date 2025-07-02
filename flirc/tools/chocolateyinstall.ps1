$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Flirc*'
  FileType      = 'EXE'
  silentArgs    = "/S"
  validExitCodes= @(0)
  url32         = 'https://'
  checksum32    = ''
  checksumType32= 'sha256'
}

Install-ChocolateyPackage @packageArgs
