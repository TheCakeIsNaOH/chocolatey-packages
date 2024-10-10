$ErrorActionPreference = 'Stop';
$url                   = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
$checksum              = 'e7040addf5fbb1dac0d7e61d0793b1550526accaf80a315e36b636285bd9d90e'
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
