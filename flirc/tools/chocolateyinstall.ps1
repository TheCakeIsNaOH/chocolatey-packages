$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Flirc*'
  FileType      = 'EXE'
  silentArgs    = "/S"
  validExitCodes= @(0)
  url           = 'https://flirc.com/software/flirc-usb/GUI/release/windows/Flirc-Setup-3.27.19.exe'
  checksum      = '3e558beb1c5f6e232ae01d8bc292b2e0332018298439fca6e2a8ce5025530e28'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
