$ErrorActionPreference = 'Stop';
$url                   = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
$checksum32            =  'f61cb1adf76a45d1cde2d7ab307d08acbddd630d4d8f14962a4fc7f5d8b6ae6b'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1622)
  softwareName  = 'minecraft*'
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs