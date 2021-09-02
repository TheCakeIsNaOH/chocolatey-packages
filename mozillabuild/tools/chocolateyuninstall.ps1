# This software does not create uninstall registry keys or have an uninstaller 

$ErrorActionPreference = 'Stop';
$defaultInstallPath    = 'C:\mozilla-build'
$versionFilePath       = Join-Path $defaultInstallPath 'VERSION'

If (Test-Path $defaultInstallPath) {
    if (Test-Path $versionFilePath) {
        $versionFileContent = [version](Get-Content $versionFilePath)
        if ($versionFileContent -eq $env:ChocolateyPackageVersion) {
            Write-Host -ForegroundColor Green "Removing MozillaBuild installed at $defaultInstallPath"
            Remove-Item -Recurse -EA 0 -Path $defaultInstallPath
        } else {
           Write-Warning "Found MozillaBuild version $versionFileContent, does not match package version $($env:ChocolateyPackageVersion)"
           Write-Warning "Skipping uninstall due to mismatched versions"
        }
    } else {
        Write-Warning "Cannot find MozillaBuild installed version, skipping uninstall"
    }
} else {
    Write-Warning "MozillaBuild default install path not found, cannot uninstall"
}
