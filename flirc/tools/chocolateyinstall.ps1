$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Flirc*'
  FileType      = 'EXE'
  silentArgs    = "/S"
  validExitCodes= @(0)
  url           = 'https://flirc.com/software/flirc-usb/GUI/release/windows/Flirc-Setup-3.27.16.exe'
  checksum32    = 'eb1fe29025fabf04d2c1868d3059fc24765791645080341578f9dd164ae70e99'
  checksumType32= 'sha256'
}

Install-ChocolateyPackage @packageArgs
