$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url                   = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.8.2.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kyoutubetomp3_3.8.2_x64.msi?source=chocolatey'
$checksum32            = '9fb5f9355f660140d175cfa38f45c113e521c37ca6593170e856cfd2cc7e978b'
$checksum64            = '4e34f428f83a76bf79c8121a40e377ddbd58d26187fce705af32427c93f6d359'
$pp                    = Get-PackageParameters
$shortcutName          = '4K YouTube to MP3.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
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