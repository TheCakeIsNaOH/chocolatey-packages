$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4ktokkit_0.9.5.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4ktokkit_0.9.5_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Tokkit.lnk'
$shortcut              = Join-Path ([System.Environment]::GetFolderPath("Desktop")) $shortcutName
$checksum32            = '8f7717e7bf3daa5676be17f68d01e503276245e0b43ea6be6e658f2465932130'
$checksum64            = 'f4e5fafe7d962f0b298cf89e3963d9b0b3c35ff997b7e1742f14ae28172c0fb7'

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
