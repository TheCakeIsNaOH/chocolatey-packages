$ErrorActionPreference = 'Stop'
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$shortcutName          = 'Dolphin Emulator (Beta).lnk'
$extractDir            = $(Get-ToolsLocation)
$extractedDir          = (Join-Path $extractDir 'Dolphin-x64')
$dolphinDir            = (Join-Path $extractDir 'Dolphin-Beta')
$exepath               = (Join-Path $dolphinDir 'Dolphin.exe')

$packageArgs = @{
  FileFullPath64 = Join-Path $toolsDir 'dolphin-master-5.0-16793-x64.7z'
  Destination    = $extractDir 
  PackageName    = $env:ChocolateyPackageName
}

Get-ChocolateyUnzip @packageArgs

if (Test-Path $dolphinDir) {
    Remove-Process -PathFilter "$([System.Text.RegularExpressions.Regex]::escape($dolphinDir))" | Out-Null
} else {
    $null = New-Item -ItemType Directory -Path $dolphinDir
}

Get-Childitem -Path $extractedDir -Recurse -File | ForEach-Object {
    $dest = (Join-Path $dolphinDir $_.FullName.SubString($extractedDir.Length))
    if (!(Test-Path (Split-Path $dest))) { $null = New-Item -ItemType Directory -Path (Split-Path $dest) }
    [System.IO.File]::Copy($_.fullname, $dest, $true)
}

Remove-Item -Force -Recurse -Path $extractedDir
Remove-Item -Force -Path $toolsDir\*.7z

Install-BinFile -Name 'Dolphin-Beta' -Path $exepath -UseStart

if ($pp['desktopicon']) {
	$desktopicon = [System.IO.Path]::Combine(([System.Environment]::GetFolderPath("Desktop")), $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $desktopicon
	Install-ChocolateyShortcut -ShortcutFilePath $desktopicon -TargetPath $exepath  -RunAsAdmin
}

if (!$pp['nostart']) {
	$starticon = (Join-Path ([System.Environment]::GetFolderPath('Programs')) $shortcutName)
	Write-Host -ForegroundColor white 'Adding ' $starticon
	Install-ChocolateyShortcut -ShortcutFilePath $starticon -TargetPath $exepath  -RunAsAdmin
}

$env:ChocolateyPackageInstallLocation = $dolphinDir
