﻿$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://download.anydesk.com/AnyDesk.exe'
$checksum32            = 'd81c4dc722ae3cf72e470dce70d2f604c99461068441a65a70c5e578f5008d17'
$pp                    = Get-PackageParameters
$fileFullPath          = (Join-Path $toolsDir 'AnyDesk.exe')

$downloadArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url32
  softwareName   = 'AnyDesk'
  checksum       = $checksum32
  checksumType   = 'sha256'
  fileFullPath   = $fileFullPath
  ForceDownload  = $true
}

Get-ChocolateyWebFile @downloadArgs

if ($pp['install'] -or $pp['path'] -or $pp['noautostart'] -or $pp['nostartmenu'] -or $pp['desktopicon'] -or $pp['updatetype']) {
	$installArgs = @{
      packageName    = $env:ChocolateyPackageName
      fileType       = 'EXE'
      silentArgs     = ' '
      file           = $fileFullPath
      validExitCodes = @(0)
    }
    
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
	
	$installArgs['silentArgs'] = $silentArgs
	
	Install-ChocolateyInstallPackage @installArgs
}
