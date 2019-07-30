$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kvideodownloader_4.8.2.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kvideodownloader_4.8.2_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Video Downloader*'

  checksum      = '9E89F88F1D62AA2D5115E1C99E7E64A7C788A2E28C258B4B25C4F32941A27174'
  checksumType  = 'sha256'
  checksum64    = '96056098885AE3F85C19003C1789C0D3C8E2BE09A82E2404C0A9621B91D7B241'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
