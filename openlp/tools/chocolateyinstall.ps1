$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.2/OpenLP-3.1.2.msi'
$url64                 = 'https://get.openlp.org/3.1.2/OpenLP-3.1.2-x64.msi'
$checksum32            = 'aa490dbcbf4fb818538b9c51b432a7e4ad869a247d4d77863f3a21270efdb405'
$checksum64            = 'b7442b9898849ecd7912d5dd0e5d92212ae91f331c7ee7ce2d04acbeef1b21e0'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'OpenLP*'
  FileType      = 'MSI'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
  url64bit      = $url64
  checksum64    = $checksum64
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs
