$ErrorActionPreference = 'Stop';
$packageName		   = '4K Stogram'
$toolsDir  			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kstogram_4.9.0.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kstogram_4.9.0_x64.msi?source=chocolatey'
$checksum32            = 'ad94897fe96d94e133c98645835fd9eed5debab8220b23877e3bdaf122315cf9'
$checksum64            = '816b3f301514a8635e645ef24a22e058adbbc1b453ffddad1211bad608fdd53b'
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
