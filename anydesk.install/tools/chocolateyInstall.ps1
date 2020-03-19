$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://download.anydesk.com/AnyDesk.msi'
$checksum32            = '3EEFBBF3417E4C4582BF646C55541D6D8E37750DB44EE11D7745CBFD07A4AA67'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url32
  softwareName  = 'AnyDesk MSI'
  checksum      = $checksum32
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs