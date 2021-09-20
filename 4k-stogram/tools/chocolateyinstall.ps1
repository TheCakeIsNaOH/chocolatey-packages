$ErrorActionPreference = 'Stop';
$packageName		   = '4K Stogram'
$toolsDir  			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kstogram_3.4.3.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kstogram_3.4.3_x64.msi?source=chocolatey'
$checksum32            = 'bb8218fbd39562cd01d0f3e90882b8797eafdf50447a68f1a903bbc2c2bfed68'
$checksum64            = '468ac6fbe145ea32b763f83e7a01ef6d99326b7a49963ea0c52c33072a9a594a'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Stogram.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)


$packageArgs = @{
  packageName   = $packageName
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
