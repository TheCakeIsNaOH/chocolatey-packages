$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_4.3.0.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_4.3.0_x64.msi?source=chocolatey'
$checksum32            = 'bcd0223d29c0bbd3d281ab0c44933a7cb3eb869c04662f9c8a15998cdb43530c'
$checksum64            = 'a1723474c502ca4c4439abed0f56f52a759c57bd3953f982dde9b7cffbeb3654'
$pp                    = Get-PackageParameters
$shortcutName          = '4K YouTube to MP3.lnk'
$shortcut              = Join-Path ([System.Environment]::GetFolderPath("Desktop")) $shortcutName

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
