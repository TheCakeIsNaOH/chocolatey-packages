
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kvideodownloader_4.7.1.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kvideodownloader_4.7.1_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Video Downloader*'

  checksum      = '816e73be4ef40f09a8683bff0d9f5f998748276602bdeee77529dcad212c1f73'
  checksumType  = 'sha256'
  checksum64    = '7fc31c3fe398404f27a0898e4d195d0c0fd759c5f60c46c4eb9f2742457ff4c7'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








