$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_4.1.1.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_4.1.1_x64.msi?source=chocolatey'
$checksum32            = '7515ed9db0effc54e88c1100ae04c039784213d883e5fbcd7b587132ff57647b'
$checksum64            = 'cba55bc6ddc0b47e717e10274e166ebfaa6f5961ee337dfef0efe4ea213cc1f4'
$pp                    = Get-PackageParameters
$shortcutName          = '4K YouTube to MP3.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName

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
