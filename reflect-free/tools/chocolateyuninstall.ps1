﻿$ErrorActionPreference = 'Stop';
$downloadDir           = (Join-Path $(Get-ToolsLocation) "reflect-free")
$softwareName          = 'Macrium Reflect Free Edition'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
}

Write-Host -ForegroundColor green "Removing downloaded files"
Remove-Item $downloadDir -Recurse -ea 0

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -le 2) {
  $key | % { 
    if ($_.UninstallString -match 'MsiExec') {
		$packageArgs['file'] = "$($_.UninstallString)"
		$packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"
		Uninstall-ChocolateyPackage @packageArgs
	}
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 2) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}