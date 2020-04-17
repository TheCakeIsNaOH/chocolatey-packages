$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters
$file                  = (Get-Childitem -Filter *.zip -Path $toolsDir).fullname
$destDir               = $toolsDir

if ($pp['path']) {
	if (!(Test-Path $pp['path'])) {
		Throw "Invalid path specified"
	}
	$destDir = $pp['path']
}

$packageArgs = @{
  FullFilePath = $file
  Destination  = $destDir
  PackageName  = $env:ChocolateyPackageName
}

Get-ChocolateyUnzip @packageArgs

if (!$pp['nostart']) {
	$fileNameGen  = "UpdateGenerator.exe"
	$fileNameInst = "UpdateInstaller.exe"
	$linkNameGen  = "UpdateGenerator.lnk"
	$linkNameInst = "UpdateInstaller.lnk"
	$programs     = [environment]::GetFolderPath([environment+specialfolder]::Programs)
	$shortcutFilePathGen  = Join-Path $programs $linkNameGen
	$shortcutFilePathInst = Join-Path $programs $linkNameInst
	$targetPathGen        = [System.IO.Path]::Combine("$destdir", "wsusoffline", $fileNameGen)
	$targetPathInst       = [System.IO.Path]::Combine("$destdir", "wsusoffline", "client", $fileNameInst)
	Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePathGen -targetPath $targetPathGen
	Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePathInst -targetPath $targetPathInst
}

Remove-Item $file -ea 0