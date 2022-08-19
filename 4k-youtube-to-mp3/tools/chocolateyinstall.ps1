$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_4.6.2.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_4.6.2_x64.msi?source=chocolatey'
$checksum32            = '0edd29c5ba93b6a9bfa141826aa4da57e6299ec1e08e1f405fe09e5d7f4e7cdd'
$checksum64            = '106237bed05dfc4ac576822fe888f3e0cca6e3e7cb487226930eb81a13cb5ac1'
$pp                    = Get-PackageParameters
$shortcutName          = '4K YouTube to MP3.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64
  softwareName  = '4K Youtube to MP3*'
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
