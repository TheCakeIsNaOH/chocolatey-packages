$ErrorActionPreference = 'Stop'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE' 
  url           = 'https://dl.google.com/earth/client/GE7/release_7_1_8/googleearth-win-7.1.8.3036.exe' 
  softwareName  = 'Google Earth*' 
  checksum      = 'B64FFC6F31E3E42F154E7D19DFA301376DE987403A9C50B575DAC04022E06576'
  checksumType  = 'sha256'
  silentArgs    = 'OMAHA=1'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
