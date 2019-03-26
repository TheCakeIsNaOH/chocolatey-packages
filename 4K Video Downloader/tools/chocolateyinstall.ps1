
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kvideodownloader_4.5.0.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kvideodownloader_4.5.0_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Video Downloader*'

  checksum      = '1458514b1769b5cc29376537da3e8eafadcb669352732f3e5337a5289c871299'
  checksumType  = 'sha256'
  checksum64    = 'ab4e62a56e5afc8dfdd0b2fe9a68e78b6208a534ac9696348f2274ab06623197'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








