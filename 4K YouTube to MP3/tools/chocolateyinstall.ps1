$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.6.2.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.6.2_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Youtube to MP3*'

  checksum      = 'f2cd47b9317bd567246981f3940ce3ca53b2b4e86da5e7d76ca54200db03f591'
  checksumType  = 'sha256'
  checksum64    = '5e3ea30e20f4a6f5637cc80c23ace1cdc37f3d98e8e2f2af3ce72e43dc5c4072'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs