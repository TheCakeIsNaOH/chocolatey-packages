
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'setup.exe'


$zipPackageArgs = @{
packageName   = $env:ChocolateyPackageName
checksum = '2ce055259511af6e64081d7ffa7e90e491ed79e8ccc5ccac456d6af9f1f4fffb'
checksumType = 'sha256'
url        = 'http://balabolka.site/balabolka.zip'
unzipLocation = $toolsDir
}
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file         = $fileLocation

  softwareName  = 'Balabolka*'

  checksum      = 'f78c301c6a9f4f12f45d8f4acc400eb687402f4b29b74657f84a114eb7ac6f3f'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
}

Install-ChocolateyZipPackage @zipPackageArgs
Install-ChocolateyPackage @packageArgs










    








