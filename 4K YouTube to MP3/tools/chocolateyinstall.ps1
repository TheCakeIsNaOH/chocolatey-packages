$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.6.1.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.6.1_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Youtube to MP3*'

  checksum      = '975bd0ee547cbb64e78c69efb8615ba3317d93d73ccba8d855c3ffa4fd4c5011'
  checksumType  = 'sha256'
  checksum64    = '302f687d0b7de51504b4bdea7de0ffc382a70b3520a50978dbe6c25cf1c8b706'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








