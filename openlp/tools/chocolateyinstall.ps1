$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/3.1.1/OpenLP-3.1.1.msi'
$url64                 = 'https://get.openlp.org/3.1.1/OpenLP-3.1.1-x64.msi'
$checksum32            = '0447f6d58a07bb9f6b2ae17e90d6e921d9ea08fbf88c95ef1b31d915b8348b2f'
$checksum64            = 'f009441016cb695b727e2483d076143f5ff10e87a052998d5aa15ba8d796370a'

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
