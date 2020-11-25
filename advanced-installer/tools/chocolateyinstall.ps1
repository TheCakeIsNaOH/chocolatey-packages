$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url                   = 'https://www.advancedinstaller.com/downloads/17.7/advinst.msi'
$checksum              = '462edae7d50a3ce441f98aa3c0367000a4113fa35d2197b30d7fa8ead8c5a874'

$packageArgs = @{
	packageName    = 'advanced-installer'
	installerType  = 'MSI'
	url            = $url
	silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
	validExitCodes = @(0)
	checksum       = $checksum
	checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
