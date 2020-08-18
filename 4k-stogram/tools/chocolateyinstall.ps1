$ErrorActionPreference = 'Stop';
$packageName		   = '4K Stogram'
$toolsDir  			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kstogram_3.0.7.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kstogram_3.0.7_x64.msi?source=chocolatey'
$checksum32            = 'eb14af9779acbd89a37939a1206e3534074be4daadbf2b2c29e1438405ab4639'
$checksum64            = '628c8b06495953c956ee98dd6f5338a43b49974b3bf4b676074c414ff24b3189'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Stogram.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName


$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64

  softwareName  = '4K Stogram*'

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
