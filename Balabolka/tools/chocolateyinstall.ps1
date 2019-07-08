$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'setup.exe'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file         = $fileLocation

  softwareName  = 'Balabolka*'

  checksum      = 'CCB32AD7FF2D5B4392D4636EACF80967362DD8D965A3EDA1F21FE5C506B064FB'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
}

Install-ChocolateyInstallPackage @packageArgs