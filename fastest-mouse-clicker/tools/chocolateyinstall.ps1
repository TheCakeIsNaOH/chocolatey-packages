$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'The Fastest Mouse Clicker for Windows version 3.lnk'
$shortcut              = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  file 			 = Join-Path $toolsDir 'Installer_TheFastestMouseClickerv3_v3.0.0.0.msi'
  softwareName   = 'The Fastest Mouse Clicker for Windows*'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

if ($pp['noicon']) {
	if (Test-Path $shortcut) {
		Remove-Item $shortcut
		Write-Host -ForegroundColor green 'Removed ' $shortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $shortcut
	}
}

Remove-Item -Force -EA 0 -Path $toolsDir\*.exe
Remove-Item -Force -EA 0 -Path $toolsDir\*.msi
