$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'setup.exe'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file         = $fileLocation
  softwareName  = 'Balabolka*'
  silentArgs   = '-silent'
}

Install-ChocolateyInstallPackage @packageArgs