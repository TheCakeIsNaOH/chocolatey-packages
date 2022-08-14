$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/2.9.5/OpenLP-2.9.5.msi'
$url64                 = 'https://get.openlp.org/2.9.5/OpenLP-2.9.5-x64.msi'
$checksum32            = 'd88c42ef103a18a3db04964b88dae0883e65bec36aece8f0591282b527a17a81'
$checksum64            = '6414c89b23575f6ab90c5ef344366f54a37db49c6a295f3b249550fd61fc3d78'

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
