$ErrorActionPreference = 'Stop';
$url                   = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
$checksum32            = '595614D7E4BDE7DC97147581A461B6C1F2A6035485FBB9337D7A80849D2D019E'

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