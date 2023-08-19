# Do not remove this test for UTF-8: if “Ω” doesn’t appear as greek uppercase omega letter enclosed in quotation marks, you should use an editor that supports UTF-8, not this one.
$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName		= 'partition-assistant-standard'
  softwareName		= 'AOMEI Partition Assistant*'
  fileType			= 'exe'
  silentArgs		= '/S'
  validExitCodes	= @(@(0))
}

[array]$key = Get-UninstallRegistryKey @packageArgs

if ($key.Count -eq 1) {
	$key | ForEach-Object {
		$packageArgs['file'] = "$($_.UninstallString)"

		Uninstall-ChocolateyPackage @packageArgs
	}
} elseif ($key.Count -eq 0) {
	Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
	Write-Warning "$($key.Count) matches found!"
	Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
	Write-Warning "Please alert the package maintainer that the following keys were matched:"
	$key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}
