$ErrorActionPreference = 'Stop';
 
$packageName = 'anydvd'
$registryUninstallerKeyName = 'AnyDVD'
$shouldUninstall = $true
 
$local_key     = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"
# local key 6432 probably never exists
$local_key6432   = "HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"
$machine_key   = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"
$machine_key6432 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName"
 
$file = @($local_key, $local_key6432, $machine_key, $machine_key6432) `
    | ?{ Test-Path $_ } `
    | Get-ItemProperty `
    | Select-Object -ExpandProperty UninstallString
 
if ($file -eq $null -or $file -eq '') {
    Write-Host "$packageName has already been uninstalled by other means."
    $shouldUninstall = $false
}

$installerType = 'EXE'
$silentArgs = "/S"
$validExitCodes = @(0)

# $file already includes an argument for the source directory. We need to add the silent arguments before
# that argument.
$file = $file -replace "/D",($silentArgs+" /D")
 
if ($shouldUninstall) {
 Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -validExitCodes $validExitCodes -File $file
}