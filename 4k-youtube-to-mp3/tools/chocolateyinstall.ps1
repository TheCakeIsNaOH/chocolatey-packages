$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.8.3.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.8.3_x64.msi?source=chocolatey'
$checksum32            = 'fc93e1e2e09b7238aa987d61a6e8b2d567857b588c6cb4f66a8d0fb4f6b802bb'
$checksum64            = '54be34245aeafb8baea76435dd94824c47b157260cfdd85d788e3e2b8eccda95'
$pp                    = Get-PackageParameters
$shortcutName          = '4K YouTube to MP3.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
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
