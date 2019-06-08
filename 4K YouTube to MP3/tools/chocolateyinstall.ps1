$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.6.3.msi?source=chocolatey'
$url64      = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.6.3_x64.msi?source=chocolatey'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = '4K Youtube to MP3*'

  checksum      = '22718d234ff36e8d23f27a0d8824e9e413492c9b135a042a1761c7728d6c07d7'
  checksumType  = 'sha256'
  checksum64    = '5a15e14cf556c8b31c9bd92853d0bd4f2f186278994286d8e03e7b292b84514a'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs