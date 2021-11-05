$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'PCSX2 (Dev).lnk'
$startPath             = Join-Path ([System.Environment]::GetFolderPath("CommonStartMenu")) $shortcutName
$desktopPath           = Join-Path ([System.Environment]::GetFolderPath("CommonDesktop")) $shortcutName
$tempPath              = Join-Path $env:temp 'PCSX2-Dev'

Remove-Item -Recurse -ea 0 -Path $tempPath 

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  FileFullPath    = Join-Path $toolsDir 'pcsx2-v1.7.2017-windows-32bit-SSE4.7z'
  FileFullPath64  = Join-Path $toolsDir 'pcsx2-v1.7.2017-windows-64bit-SSE4.7z'
  Destination     = "$tempPath"
}

Get-ChocolateyUnzip @packageArgs

if ($pp['Path']) {
	$destination = $pp['Path']
	if (!(Test-Path "$destination" -IsValid)) {
		Throw "Bad path parameter"
	}
} else {
	$destination = Join-Path $(Get-ToolsLocation) 'PCSX2-Dev'
}

$null = New-Item -ItemType Directory -Path $destination -Force

$configFile = [IO.Path]::Combine("$destination" , "Shaders" , "GSdx_FX_Settings.ini")
if (Test-Path $configFile) {
	Write-Output "Backing up GSdx_FX_Settings.ini shaders folder"
	Rename-Item -Path $configFile -Force -ea 0 -NewName ("GSdx_FX_Settings-" + (Get-Date -Format "yyyy-MM-dd").tostring() + "-backup.ini")
}

Write-Host -ForegroundColor white "Copying files to $destination"

$innerFolder = (Get-ChildItem -Path "$tempPath" -Filter "PCSX2*").FullName
$fileList = Get-ChildItem -Path $innerFolder | Copy-Item -Destination $destination -Recurse -Force -PassThru
$fileList | select -ExpandProperty FullName | Out-File -Force -FilePath (Join-Path $toolsDir 'install-files.txt')

if (((Get-OSArchitectureWidth -compare 32) -or ($env:chocolateyForceX86 -eq $true)) { 
    $exePath = Join-Path "$destination" "pcsx2.exe"
} else {
    $exePath = Join-Path "$destination" "pcsx2x64.exe"
}

if (!$pp['nostart']) {
    Write-Host -ForegroundColor white 'Adding ' $startPath
	Install-ChocolateyShortcut -ShortcutFilePath "$startPath" -TargetPath "$exePath" -WorkingDirectory "$destination"
}

if ($pp['Desktop']) {
    Write-Host -ForegroundColor white 'Adding ' $desktopPath
	Install-ChocolateyShortcut -ShortcutFilePath "$desktopPath" -TargetPath "$exePath" -WorkingDirectory "$destination"
}

Remove-Item -ea 0 -Path $toolsDir\*.7z
Remove-Item -Recurse -ea 0 -Path $tempPath 

$env:ChocolateyPackageInstallLocation = $destination
