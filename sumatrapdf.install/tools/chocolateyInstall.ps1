$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file32                = (Get-ChildItem -Path $toolsDir -Filter "*_x32.exe").FullName
$file64                = (Get-ChildItem -Path $toolsDir -Filter "*_x64.exe").FullName
$pp                    = Get-PackageParameters
$shortcutName          = 'SumatraPDF.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("DesktopDirectory")) $shortcutName
$args                  = '/S '

if ($pp['WithFilter']) {
    $args = $args + ' /with-filter '
}

if ($pp['WithPreview']) {
    $args = $args + ' /with-preview '
}

if ($pp['Path']) {
	$path = $pp['Path']
    if (!(Test-Path $path -IsValid)) {
		Throw "Bad path parameter"
	}
	$args = $args + " /D $path"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = $file32
  file64        = $file64
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