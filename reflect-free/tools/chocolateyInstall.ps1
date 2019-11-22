$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition
$url                   = 'https://updates.macrium.com/reflect/v7/ReflectDLHF.exe'
$agentfileName         = $url -split '/' | select -Last 1
$downloadDir           = (Join-Path $(Get-ToolsLocation) "reflect-free")


if ((Get-WmiObject win32_operatingsystem).caption -match "Server") {
	Write-Host -ForegroundColor red "Non compatible Windows Server OS detected"
	throw  "Install failed due to Server OS"
}

Remove-Item $downloadDir -Recurse -ea 0

$downloadArgs = @{
	packageName   = 'reflect-free'
	FileFullPath  = (Join-Path $downloadDir $agentfileName)
	url           = $url
	forceDownload = $true
}

Get-ChocolateyWebFile @downloadArgs

Write-Host -ForegroundColor green "Running Macrium download agent via Autohotkey"
Autohotkey.exe $toolsDir\download.ahk "$downloadDir\$agentfileName" $downloadDir

$installer = Get-Item $downloadDir\Macrium\*.exe -ea 0

if (!$installer) { 
	Write-Host -ForegroundColor red "Autohotkey script failed for Macrium download agent, please run manually $downloadDir\$agentfileName" 
}
else {
	$packageArgs = @{
		packageName    = 'reflect-free'
		fileType       = 'exe'
		file           = $installer
		validExitCodes = @(0)
		silentArgs     = "/qn /norestart"
	}

	Write-Host -ForegroundColor green "Running $installer"
	Install-ChocolateyInstallPackage @packageArgs

	Write-Host -ForegroundColor green "Installation completed"
	Write-Host -ForegroundColor green "Downloaded files are left in: $downloadDir"
}