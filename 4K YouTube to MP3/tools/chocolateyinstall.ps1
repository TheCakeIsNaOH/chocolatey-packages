
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.4.0.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.4.0_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Youtube to MP3*'

  checksum      = 'ca7e89e4309b32d52841c5acdd9ab9cb66e87a60475adea66d3b77abab9d24cf'
  checksumType  = 'sha256'
  checksum64    = 'ad33dec376c9c22a604228c67fe2f29685ddd4d99aac96cd4535399079307f38'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








