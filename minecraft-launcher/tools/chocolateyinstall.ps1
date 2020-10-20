$ErrorActionPreference = 'Stop';
$url                   = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
$checksum              = 'cfc871d07e1531f5a29c3deb1785f51ef25959a9d05dfbb62640ade2f467faa0'
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
