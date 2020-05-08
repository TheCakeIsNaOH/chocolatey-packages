$ErrorActionPreference = 'Stop';
$packageName		   = '4K Stogram'
$toolsDir  			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kstogram_3.0.1.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kstogram_3.0.1_x64.msi?source=chocolatey'
$checksum32            = 'c67fc6610efa139faeee41b8a48efde6dd6eb85e03bb3e33306858d3cc8e5b0c'
$checksum64            = '7eb6f74bf64903c430c52bb271cfef2e71826b06856d1fb47ea992c16f81c284'
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
