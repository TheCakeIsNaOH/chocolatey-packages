$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kvideodownloader_4.7.2.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kvideodownloader_4.7.2_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Video Downloader*'

  checksum      = 'fc558d48341bddcbbd04f9c28ef242f5a3e73dd2d2811f17b64df52eda196455'
  checksumType  = 'sha256'
  checksum64    = '13b7b234c8dbb3f0ae0b4af9e772e580195291d1f78085a25f9e8c53c27ab711'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
