$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64                 = 'https://edge.elgato.com/egc/windows/egcw/3.70/final/GameCaptureSetup_3.70.43.3043_x64.msi'
$checksum64            = '8F4A81E0E4CC794EAF1C9E33C2C8ADE8B345DE1E524369FC7E31D8DFF3F83D5E'
$pp                    = Get-PackageParameters
$gcShortcutName        = 'Game Capture HD.lnk'
$scShortcutName        = 'Sound Capture.lnk'
$scshortcut            = Join-Path ([Environment]::GetFolderPath("CommonDesktop")) $scShortcutName
$gcshortcut            = Join-Path ([Environment]::GetFolderPath("CommonDesktop")) $gcShortcutName

$cert = Get-ChildItem Cert:\LocalMachine\TrustedPublisher -Recurse | Where-Object { $_.Thumbprint -eq '1C34353BB195727CD0DAAEFAA7B1DA3DE5CDFA5E' }
if (!$cert) {
    Start-ChocolateyProcessAsAdmin "certutil -addstore -f 'TrustedPublisher' $toolsDir\Elgato.cer"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url64bit      = $url64
  softwareName  = 'Elgato Game Capture HD*'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

if ($pp['nodesktop']) {
	if (Test-Path $gcshortcut) {
		Remove-Item $gcshortcut
		Write-Host -ForegroundColor green 'Removed ' $gcshortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $gcshortcut ' to remove'
	}
	if (Test-Path $scshortcut) {
		Remove-Item $scshortcut
		Write-Host -ForegroundColor green 'Removed ' $scshortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $scshortcut ' to remove'
	}
}