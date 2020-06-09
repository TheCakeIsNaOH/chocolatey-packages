$ErrorActionPreference = 'Stop';
$packageName		   = '4K Stogram'
$toolsDir  			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kstogram_3.0.4.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kstogram_3.0.4_x64.msi?source=chocolatey'
$checksum32            = '676a014b53bde01f88be73810337a8f3049808c55b549b842a3f570bf9a1a8e2'
$checksum64            = '5b2f000730c96338ae0e28680f9db4663fa02d31687517fec365178962cbcc97'
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
