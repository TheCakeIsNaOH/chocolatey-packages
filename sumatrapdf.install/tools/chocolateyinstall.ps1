$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'SumatraPDF.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("DesktopDirectory")) $shortcutName
$args                  = '/S '

if ($pp['WithFilter']) {
    $args = $args + ' -with-filter '
}

if ($pp['WithPreview']) {
    $args = $args + ' -with-preview '
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
  file          = Join-Path $toolsDir 'SumatraPDF-3.3.1-install_x32.exe'
  file64        = Join-Path $toolsDir 'SumatraPDF-3.3.1-64-install_x64.exe'
  silentArgs    = $args
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

if ($pp['NODESKTOP']) {
	if (Test-Path $shortcut) {
		Write-Host -ForegroundColor green "Removing desktop shortcut"
		Remove-Item $shortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $shortcut
	}
}

Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
