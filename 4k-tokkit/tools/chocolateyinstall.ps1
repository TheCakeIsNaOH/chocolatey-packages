$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4ktokkit_2.7.4.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4ktokkit_2.7.4_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Tokkit.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)
$checksum32            = '0e749812a9633e5f7c644c63475ab58eaa245fa5970c194af0e62327229083bc'
$checksum64            = 'ae143e17e2faaeee0fe1419b8db67a70f5546bc36960d5ad9fea170772bfcf37'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64
  softwareName  = '4K Tokkit*'
  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

if ($pp['noicon']) {
	if (Test-Path $shortcut) {
		Remove-Item $shortcut
		Write-Host -ForegroundColor green 'Removed ' $shortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $shortcut
	}
}
