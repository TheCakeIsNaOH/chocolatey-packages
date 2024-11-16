$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.5/OpenLP-3.1.5.msi'
$url64                 = 'https://get.openlp.org/3.1.5/OpenLP-3.1.5-x64.msi'
$checksum32            = '33e6cff15505537d1cca40104864a90ad197a655d2faf4a44597a3ee8091896e'
$checksum64            = '8ce5780069d8f3dac8f05482058a0959a015b3736f2ac52198b29be73d0e8457'

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
