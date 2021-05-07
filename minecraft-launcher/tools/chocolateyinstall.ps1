$ErrorActionPreference = 'Stop';
$url                   = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
$checksum              = '1d9f66794a5af4e409a6c6b32a14d674cc1ea96f69e2cf2acb3c7b997750d5f8'
$pp                    = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1622)
  softwareName  = 'minecraft*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

if ($pp['noicon']) {
	$packageArgs['silentArgs'] = $packageArgs['silentArgs'] + ' INSTALLSHORTCUT=""'
}

Install-ChocolateyPackage @packageArgs
