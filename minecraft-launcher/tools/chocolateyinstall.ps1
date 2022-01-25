$ErrorActionPreference = 'Stop';
$url                   = 'https://launcher.mojang.com/download/MinecraftInstaller.msi'
$checksum              = '56f784422201d2082380d991fc9cdff60d5ad2df9927ac543005848c4f0823e5'
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
