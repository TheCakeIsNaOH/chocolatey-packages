$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$instDir    = "$(Join-Path ${ENV:TEMP} 'rtxvoiceinstall')" # Folder to move desired components into

$packageArgs = @{
	packageName    = 'rtx-voice'
	destination    = $instDir
	url64          = 'https://developer.download.nvidia.com/rtx/broadcast_engine/RTX_Voice/NVIDIA_RTX_Voice_v0.5.12.6.exe'
	checksum64     = '40FB419EB1BAFF1717A2057863076D6D0E78612FBDA772EDE188B74778503832'
	checksumType64 = 'sha256'
	silentArgs     = '-s -noreboot'
	validExitCodes = @(0,1)
	softwareName   = 'NVIDIA RTX Voice Application*'
}

if ([Environment]::OSVersion.Version.Major -lt 10) {
	Write-Warning "RTX Voice requires Windows 10 to work"
}

if ((Get-WmiObject win32_VideoController).description -notmatch "nvidia") {
	Write-Warning "RTX Voice requires an Nvidia Graphics card to work"
	$nortx = $true
} elseif ((Get-WmiObject win32_VideoController).description -notmatch "RTX") {
	Write-Warning "RTX Voice only officially supports RTX Grapics cards"
	$nortx = $true
} else {
	$nortx = $false
}


Remove-Item "$instDir" -Recurse -Force -ea 0
New-Item -Path "$instDir" -ItemType Directory

$packageArgs['file'] = "$(Join-Path ${ENV:TEMP} 'rtxvoice.zip')"
Get-ChocolateyWebFile @packageArgs

Get-ChocolateyUnzip @packageArgs

if ($nortx -eq $true) {
	$configfile = [System.IO.Path]::Combine("$instDir", 'NvAFX' , 'RTXVoice.nvi')
	[xml]$configxml = Get-Content $configfile
	$configxml.nvi.RemoveChild($configxml.nvi.constraints)
	$configxml.Save($configfile)
}

$packageArgs['file'    ] = "$(Join-Path $instDir 'setup.exe')"
$packageArgs['fileType'] = 'EXE'

Install-ChocolateyInstallPackage @packageArgs