$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = (Get-ChildItem -Path $toolsDir -Filter "pcsx2*.7z").fullname
$pp                    = Get-PackageParameters
$shortcutName          = 'PCSX2 Portable.lnk'
$startPath             = Join-Path ([Environment]::GetFolderPath("CommonStartMenu")) $shortcutName
$desktopPath           = Join-Path ([Environment]::GetFolderPath("CommonDesktop")) $shortcutName
$tempPath              = Join-Path $env:temp 'PCSX2-portable'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = $fileLocation
  Destination   = "$tempPath"
}

Get-ChocolateyUnzip @packageArgs

if ($pp['Path']) {
	$destination = $pp['Path']
	if (!(Test-Path "$destination" -IsValid)) {
		Throw "Bad path parameter"
	}
} else {
	$destination = Join-Path $(Get-ToolsLocation) 'PCSX2'
}

Mkdir -Path $destination -Force | Out-Null

$configFile = [IO.Path]::Combine("$destination" , "Shaders" , "GSdx_FX_Settings.ini")
if (Test-Path $configFile) {
	Write-Output "Backing up GSdx_FX_Settings.ini shaders folder"
	Rename-Item -Path $configFile -Force -ea 0 -NewName ("GSdx_FX_Settings-" + (Get-Date -Format "yyyy-MM-dd").tostring() + "-backup.ini")
}

$innerFolder = (Get-ChildItem -Path "$tempPath" -Filter "PCSX2*").FullName
$fileList = Get-ChildItem -Path $innerFolder | Copy-Item -Destination $destination -Recurse -Force -PassThru
$fileList | select -ExpandProperty FullName | Out-File -Force -FilePath (Join-Path $toolsDir 'install-files.txt')

$exePath = Join-Path "$destination" "pcsx2.exe"

if ($pp['Start']) {
	Install-ChocolateyShortcut -ShortcutFilePath "$startPath" -TargetPath "$exePath" -WorkingDirectory "$destination"
}

if ($pp['Desktop']) {
	Install-ChocolateyShortcut -ShortcutFilePath "$desktopPath" -TargetPath "$exePath" -WorkingDirectory "$destination"
}

Remove-Item -ea 0 -Path $fileLocation
Remove-Item -Recurse -ea 0 -Path $tempPath 