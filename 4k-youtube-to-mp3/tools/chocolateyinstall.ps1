$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.13.2_online.exe?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.13.2_x64_online.exe?source=chocolatey'
$checksum32            = '1988172c4e84a3ba53521ccc91604f26adc95c94998cc120582f594955d4f51a'
$checksum64            = '896be65494b7bc2c4749e049855e460fd990d3eca31369fa23bc1e0315f685fb'
$pp                    = Get-PackageParameters
$shortcutName          = '4K YouTube to MP3.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64
  softwareName  = '4K Youtube to MP3*'
  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/quiet /norestart /log `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
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
