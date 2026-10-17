$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url                   = 'https://www.advancedinstaller.com/downloads/24.1/advinst.msi'
$checksum              = '139a97ae4b7c72566c3746bb5763a36f0c198670b80601b3b939412940c06cf5'

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
