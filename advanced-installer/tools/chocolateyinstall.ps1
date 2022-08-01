$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url                   = 'https://www.advancedinstaller.com/downloads/19.7.1/advinst.msi'
$checksum              = '74f82a3100e6bb46e575fc806b7b118d1f0fb986591bbb8e8d03d56a8d9ed030'

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
