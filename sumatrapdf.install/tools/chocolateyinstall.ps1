$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'SumatraPDF.lnk'
$args                  = '/S '

# Test to avoid error in cases where DesktopDirectory is null (choco.exe running as SYSTEM, etc)
if (![string]::IsNullOrWhiteSpace([System.Environment]::GetFolderPath('Desktop'))) {
	$shortcut              = Join-Path ([System.Environment]::GetFolderPath('Desktop')) $shortcutName
}

if ($pp['WithFilter']) {
    $args = $args + ' -with-filter '
}

if ($pp['WithPreview']) {
    $args = $args + ' -with-preview '
}

if ($pp['UserLevelInstall']) {
    Write-Host -ForegroundColor Cyan "Installing SumatraPDF for your user only"
} else {
    Write-Host -ForegroundColor Cyan "Installing SumatraPDF system wide for all users"
    Write-Host -ForegroundColor Cyan 'To revert back to a single user install, use --package-parameters=''"/UserLevelInstall"'''
    $args = $args + ' -all-users '
}

if ($pp['Path']) {
	$path = $pp['Path']
    if (!(Test-Path $path -IsValid)) {
		Throw "Bad path parameter"
	}
	$args = $args + ' -d "' + $path + '"'
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = Join-Path $toolsDir 'SumatraPDF-3.4.5-install_x32.exe'
  file64        = Join-Path $toolsDir 'SumatraPDF-3.4.5-64-install_x64.exe'
  silentArgs    = $args
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

if ($pp['NODESKTOP']) {
	if (!$shortcut) {
		Write-Host -ForegroundColor yellow "Unable to get the 'Desktop' folder (Is choco running as System?).  Not attempted to remove Desktop Shortcut."
	} elseif (Test-Path $shortcut) {
		Write-Host -ForegroundColor green "Removing desktop shortcut"
		Remove-Item $shortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $shortcut
	}
}

Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
