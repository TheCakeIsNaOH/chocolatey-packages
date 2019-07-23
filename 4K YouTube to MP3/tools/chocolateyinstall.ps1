$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.7.1.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.7.1_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Youtube to MP3*'

  checksum      = '7534C9743E76233F3AB340E4843D49F72CD196155D70F3325A0B4DB3A8DEF80Fs'
  checksumType  = 'sha256'
  checksum64    = 'FD825D04C798612A11AD60C319E51E1F2831A3462F216D7FD11475B497CF3566'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs