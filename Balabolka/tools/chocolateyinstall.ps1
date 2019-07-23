$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'setup.exe'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file         = $fileLocation

  softwareName  = 'Balabolka*'

  checksum      = 'C0CFBAB69EEE1EE65DD293308B1263543EC7A01E4EDD6C56688875221B9E118C'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
}

Install-ChocolateyInstallPackage @packageArgs