$ErrorActionPreference = 'Stop';
$url                   = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
$checksum              = '70119c7df5e2ee1e553c2cfad8cf52d3928f22bd3acbc24ad6069f2daf068e43'
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
