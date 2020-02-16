$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = (Get-ChildItem $toolsDir -Filter "*.exe").FullName
$pp                    = Get-PackageParameters
$shortcutName          = 'The Fastest Mouse Clicker for Windows.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file 			 = $fileLocation
  softwareName   = 'The Fastest Mouse Clicker for Windows*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
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
