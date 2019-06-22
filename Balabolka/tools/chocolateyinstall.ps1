$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'setup.exe'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file         = $fileLocation

  softwareName  = 'Balabolka*'

  checksum      = '0154F669827BFCC2C8A1D0F043DDE2283F8CDEE038671ED71BBB9723ADD97FE8'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
}

Install-ChocolateyInstallPackage @packageArgs