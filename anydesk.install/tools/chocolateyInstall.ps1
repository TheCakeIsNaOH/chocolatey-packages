$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://download.anydesk.com/AnyDesk.msi'
$checksum32            = 'd4a79db5c21b2f0241057cc69df78a0ea6b27888ede66fc698791a19a6260e31'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url32
  softwareName  = 'AnyDesk MSI'
  checksum      = $checksum32
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Write-Host -ForegroundColor green "Trying to uninstall older versions of $packageName due to a limitation in the installer"
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']
if ($key.Count -eq 1) {
  $key | % { 
    $packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"
    $packageArgs['file'] = ''
    Uninstall-ChocolateyPackage @packageArgs
    $packageArgs['silentArgs'] = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  }
} elseif ($key.Count -eq 0) {
  Write-Host -ForegroundColor green "$packageName is not installed, continuing on to install"
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}

Install-ChocolateyPackage @packageArgs
