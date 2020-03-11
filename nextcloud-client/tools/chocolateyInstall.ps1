$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition
$fileLocation          = (Get-ChildItem $toolsDir -Filter "*.exe").FullName
$pp                    = Get-PackageParameters
$shortcutName          = 'Nextcloud.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("CommonDesktopDirectory")) $shortcutName
$publisherRegKey       = "HKLM:\Software\Policies\Nextcloud GmbH\"
$productRegKey         = "HKLM:\Software\Policies\Nextcloud GmbH\Nextcloud\"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file 			= $fileLocation
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

if (!($pp['icon'])) {
	if (Test-Path $shortcut) {
		Remove-Item $shortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $shortcut
	}
} else {
	Write-Host -ForegroundColor green 'Adding desktop shortcut'
}

if (!($pp['KeepUpdateCheck'])) {
	if (!(Test-Path $publisherRegKey)) {
		Write-Host -ForegroundColor green 'Adding ' $publisherRegKey
		$null = New-Item -Force -Path $publisherRegKey
	}
	
	if (!(Test-Path $productRegKey)) {
		Write-Host -ForegroundColor green 'Adding ' $productRegKey
		$null = New-Item -Force -Path $productRegKey
	}
	
	if (Test-Path $productRegKey) {
		$null = New-ItemProperty -Path $productRegKey -Name 'skipUpdateCheck' -Value 1 
	} else {
		Write-Host -ForegroundColor green 'Stopping update check failed'
	}
}

Remove-Item $fileLocation -ea 0