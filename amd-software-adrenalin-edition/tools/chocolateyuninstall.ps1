$ErrorActionPreference = 'Stop'

$packageArgs = @{
  softwareName  = 'AMD Software'
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  silentArgs    = '/EXPRESS_UNINSTALL /IGNORE_UPGRADE /ON_REBOOT_MESSAGE:NO'
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

function Split-CommandLine {
    param([string] $file)
    return $file
}

if ($key.Count -eq 1) {
  $key | % {   
    # Remove quotes and trailing arguments if any
    $packageArgs['file'] = Invoke-Expression "Split-CommandLine $($_.UninstallString)"
	Uninstall-ChocolateyPackage @packageArgs
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}