$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url                   = 'https://www.advancedinstaller.com/downloads/19.2/advinst.msi'
$checksum              = '5d07eae5a291a87c888d480e1887051fe185347c4afe842b2c61f7500072a18b'

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
