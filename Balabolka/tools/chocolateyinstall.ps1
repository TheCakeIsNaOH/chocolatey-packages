$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'setup.exe'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file         = $fileLocation

  softwareName  = 'Balabolka*'

  checksum      = '93dac22566618138a1ec0d98bfb7ca8ba74484161047a89d6f39746902199298'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
}

Install-ChocolateyInstallPackage @packageArgs