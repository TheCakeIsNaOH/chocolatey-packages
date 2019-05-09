
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'setup.exe'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file         = $fileLocation

  softwareName  = 'Balabolka*'

  checksum      = '72f6cffce383d335a2589a48f4fdb8c74b4c5a30b981fec3f90f56ef990884b8'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
}

Install-ChocolateyInstallPackage @packageArgs










    








