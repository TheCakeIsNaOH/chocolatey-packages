﻿$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://download.anydesk.com/AnyDesk.exe'
$checksum32            = '94fe42af4a67ed5be45bd7913d8a8aebc4e35afddd5675d01bd37df8e9b399ae'
$pp                    = Get-PackageParameters
$fileFullPath          = (Join-Path $toolsDir 'AnyDesk.exe')

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url32
  softwareName   = 'AnyDesk'
  checksum       = $checksum32
  checksumType   = 'sha256'
  silentArgs     = ' '
  validExitCodes = @(0)
  fileFullPath   = $fileFullPath
  ForceDownload  = $true
}

if ($pp['install'] -or $pp['path'] -or $pp['noautostart'] -or $pp['nostartmenu'] -or $pp['desktopicon'] -or $pp['updatetype']) {
	
	$silentArgs = ' --install '
	
	if ($pp['path']) {
		$silentArgs = $silentArgs + ' ' + $pp['path'] + ' '
	} else {
		$silentArgs = $silentArgs + ' "C:\Program Files (x86)\AnyDesk" '
	}
	
	if (!$pp['noautostart']) {
		$silentArgs = $silentArgs + ' --start-with-win '
	}
	
	$silentArgs = $silentArgs +  ' --silent --remove-first ' 
	
	if (!$pp['nostartmenu']) {
		$silentArgs = $silentArgs + ' --create-shortcuts '
	}
	
	if ($pp['desktopicon']) {
		$silentArgs = $silentArgs + ' --create-desktop-icon '
	}
	
	if ((!$pp['updatetype']) -or ($pp['updatetype'] -ieq 'disabled')) {
		$silentArgs = $silentArgs + ' --update-disabled'
	} elseif ($pp['updatetype'] -ieq 'manually') {
		$silentArgs = $silentArgs + ' --update-manually'
	} elseif ($pp['updatetype'] -ieq 'auto') {
		$silentArgs = $silentArgs + ' --update-auto'
	}
	
	$packageArgs['silentArgs'] = $silentArgs
	
	Install-ChocolateyPackage @packageArgs
} else {
	Get-ChocolateyWebFile @packageArgs
}
