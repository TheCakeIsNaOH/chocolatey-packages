$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.3/OpenLP-3.1.3.msi'
$url64                 = 'https://get.openlp.org/3.1.3/OpenLP-3.1.3-x64.msi'
$checksum32            = '006f8b9007b8967a1e02ec59943d1ce97e1814e581d23a64623bced898715753'
$checksum64            = '205c78a12b6e269cd2a020857ee6c9b77fe7bae505edbb94642704e0ceecf797'

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
