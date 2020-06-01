$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://get.openlp.org/2.9.1/OpenLP-2.9.1.msi'
$url64                 = 'https://get.openlp.org/2.9.1/OpenLP-2.9.1-x64.msi'
$checksum32            = '02F595AB08460420B6E50443FB54B714D4586E02CCFC5E2E08BA7153BA2F9A3F'
$checksum64            = '9E1F5BB1A4FAED0B6DD6B421000168C571F4D7745DA795388B8257543B9D165F'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'OpenLP*'
  url           = $url32
  url64bit      = $url64
  FileType      = 'MSI'
  checksum      = $checksum32
  checksumType  = 'sha256' 
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs