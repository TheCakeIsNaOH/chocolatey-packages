$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url                   = 'https://www.advancedinstaller.com/downloads/18.5/advinst.msi'
$checksum              = '8f176922e9cb95ead6fab52959d9b0631ed2557e7072b8b760ed57d8f0815492'

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
