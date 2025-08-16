$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Flirc*'
  FileType      = 'EXE'
  silentArgs    = "/S"
  validExitCodes= @(0)
  url           = 'https://flirc.com/software/flirc-usb/GUI/release/windows/Flirc-Setup-3.27.17.exe'
  checksum      = 'b0a80de7638e21532ade10491068c9d13fba0039bd2b139298688e6d6da1a160'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
