


$ErrorActionPreference = 'Stop';
$start = [Environment]::GetFolderPath("commonstartmenu")
$shortcutFolder = join-path $start  "programs\DiskInternals"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'DiskInternals Linux Reader*'
  fileType      = 'EXE'
  silentArgs   = '/S'
}

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | % { 
    $packageArgs['file'] = "$($_.UninstallString)"
    
    if ($packageArgs['fileType'] -eq 'MSI') {
      $packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"
      
      $packageArgs['file'] = ''
    } else {
    }

    Uninstall-ChocolateyPackage @packageArgs
	
	Write-host "Removing leftover shortcuts"
	Remove-item "$shortcutFolder\DiskInternals Linux Reader.lnk"
	Remove-item "$shortcutFolder\DiskInternals Research.lnk"
	if( (Get-ChildItem $shortcutFolder | Measure-Object).Count -eq 0) {
	Remove-item -Recurse $shortcutFolder
	}
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}


