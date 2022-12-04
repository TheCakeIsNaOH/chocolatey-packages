$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'PCSX2 (Dev).lnk'
$startPath             = Join-Path ([System.Environment]::GetFolderPath("CommonStartMenu")) $shortcutName
$desktopPath           = Join-Path ([System.Environment]::GetFolderPath("CommonDesktop")) $shortcutName
$tempPath              = Join-Path $env:temp 'PCSX2-Dev'

Remove-Item -Recurse -ea 0 -Path $tempPath 

if ((Get-OSArchitectureWidth -compare 32) -or ($env:chocolateyForceX86 -eq $true)) {
    Throw "32-bit builds have been dropped. Install version 1.7.2484-dev or older for a 32 bit build"
}

$SSE4_Qt = Join-Path $toolsDir 'pcsx2-v1.7.3675-windows-64bit-SSE4-Qt.7z'
$SSE4_wxWidgets = Join-Path $toolsDir 'pcsx2-v1.7.3675-windows-64bit-SSE4-wxWidgets.7z'
$AVX2_Qt = Join-Path $toolsDir 'pcsx2-v1.7.3675-windows-64bit-AVX2-Qt.7z'
$AVX2_wxWidgets = Join-Path $toolsDir 'pcsx2-v1.7.3675-windows-64bit-AVX2-wxWidgets.7z'


if ($pp['Path']) {
	$destination = $pp['Path']
	if (!(Test-Path "$destination" -IsValid)) {
		Throw "Bad path parameter"
	}
} else {
	$destination = Join-Path $(Get-ToolsLocation) 'PCSX2-Dev'
}

if ($pp['UseAvx2'] -and $pp['UseQt']) {
    Write-Output "Installing AVX2 QT build. See package description for how to switch which build is installed"
    $file64 = $AVX2_Qt
    $exePath = Join-Path "$destination" "pcsx2-qtx64-avx2.exe"
} elseif ($pp['UseAvx2']) {
    Write-Output "Installing AVX wxWidgets build. See package description for how to switch which build is installed"
    $file64 = $AVX2_wxWidgets
    $exePath = Join-Path "$destination" "pcsx2x64-avx2.exe"
} elseif ($pp['UseQT']) {
    Write-Output "Installing SSE4 QT build. See package description for how to switch which build is installed"
    $file64 = $SSE4_Qt
    $exePath = Join-Path "$destination" "pcsx2-qtx64.exe"
} else {
    Write-Output "Installing SSE4 wxWidgets build. See package description for how to switch which build is installed"
    $file64 = $SSE4_wxWidgets
    $exePath = Join-Path "$destination" "pcsx2x64.exe"
}

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  FileFullPath64  = $file64
  Destination     = "$tempPath"
}

Get-ChocolateyUnzip @packageArgs

$null = New-Item -ItemType Directory -Path $destination -Force

$configFile = [IO.Path]::Combine("$destination" , "Shaders" , "GSdx_FX_Settings.ini")
if (Test-Path $configFile) {
	Write-Output "Backing up GSdx_FX_Settings.ini shaders folder"
	Rename-Item -Path $configFile -Force -ea 0 -NewName ("GSdx_FX_Settings-" + (Get-Date -Format "yyyy-MM-dd").tostring() + "-backup.ini")
}

Write-Host -ForegroundColor white "Copying files to $destination"

#$innerFolder = (Get-ChildItem -Path "$tempPath" -Filter "PCSX2*").FullName
#$fileList = Get-ChildItem -Path $innerFolder | Copy-Item -Destination $destination -Recurse -Force -PassThru
$fileList = Get-ChildItem -Path $tempPath | Copy-Item -Destination $destination -Recurse -Force -PassThru
$fileList | select -ExpandProperty FullName | Out-File -Force -FilePath (Join-Path $toolsDir 'install-files.txt')

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
