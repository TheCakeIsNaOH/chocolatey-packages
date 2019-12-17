$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition
$url32                 = 'https://updates.macrium.com/reflect/v7/ReflectDLHF.exe'
$agentfileName         = $url32 -split '/' | select -Last 1
$downloadDir           = (Join-Path $(Get-ToolsLocation) "reflect-free")
$pp                    = Get-PackageParameters
$checksum32            = '4abc1ac76f594f31e9f4fbce2e81c1d1ced2a89943d34f0605b9698d0cb6b02d'
$macriumPath           = (Join-Path $env:programfiles 'macrium\reflect')

if ((Get-WmiObject win32_operatingsystem).caption -match "Server") {
	Write-Host -ForegroundColor red "Non compatible Windows Server OS detected"
	throw  "Install failed due to Server OS"
}

Remove-Item $downloadDir -Recurse -ea 0

$downloadArgs = @{
	packageName   = 'reflect-free'
	FileFullPath  = (Join-Path $downloadDir $agentfileName)
	url           = $url32
	checksumType  = 'sha256'
	checksum      = $checksum32
}

Get-ChocolateyWebFile @downloadArgs

Write-Host -ForegroundColor green "Running Macrium download agent via Autohotkey"
Autohotkey.exe $toolsDir\download.ahk "$downloadDir\$agentfileName" $downloadDir

$installer = Get-Item $downloadDir\Macrium\*.exe -ea 0

if (!$installer) { 
	Write-Host -ForegroundColor red "Autohotkey script failed for Macrium download agent, please manually run $downloadDir\$agentfileName" 
}
else {
	$packageArgs = @{
		packageName    = 'reflect-free'
		fileType       = 'exe'
		file           = $installer
		validExitCodes = @(0)
		silentArgs     = "/qn /norestart NOIMAGEGUARDIAN=YES NOVIBOOT=YES NOCBT=YES"
	}

	if (!$pp['desktopicon']) {
		Write-Host -ForegroundColor green 'Not adding a desktop shortcut'
		$packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) NODESKTOPSHORTCUT=YES"
	}
	
	Write-Host -ForegroundColor green "Running $installer"
	Install-ChocolateyInstallPackage @packageArgs

	if (Test-Path $macriumPath) {	
		Write-Host -ForegroundColor green "Installation completed"
		Write-Host -ForegroundColor green "Downloaded files are left in: $downloadDir"
	} else {
		Write-Host -ForegroundColor red "$downloadDir\Macrium\$installer needs to be run manually"
		Write-Host -ForegroundColor red "This is required due to a bug or intentional limitation the free installer"
		Write-Host -ForegroundColor red "The silent install option fails if reflect is being installed instead of upgraded"
		Write-Host -ForegroundColor red "It is being worked on to automate"
	}
}