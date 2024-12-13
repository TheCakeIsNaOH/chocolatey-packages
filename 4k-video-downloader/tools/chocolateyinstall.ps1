$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://dl.4kdownload.com/app/4kvideodownloader_4.33.2.msi?source=chocolatey'
$url64                 = 'https://dl.4kdownload.com/app/4kvideodownloader_4.33.2_x64.msi?source=chocolatey'
$pp                    = Get-PackageParameters
$shortcutName          = '4K Video Downloader.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)
$checksum32            =  '2ccd89cf12920ff73dad680359d33c2ec09121138f063ef3e908d1a1f1f5f0b1'
$checksum64            =  '8cc21fcd3ca2e6349fa595e194e662db4a663c88d8b2edbc4edcfdf6f34a0dd7'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64
  softwareName  = '4K Video Downloader*'
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
