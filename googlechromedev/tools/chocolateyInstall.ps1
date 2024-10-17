$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '132.0.6779.0-dev'
if ($version -le (Get-ChromeDevVersion)) {
  Write-Host "Google Chrome Dev $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'MSI'
  url                    = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise.msi'
  url64bit               = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise64.msi'
  checksum               = 'ca97d2c25cdd8f3b00a242a1c9518b1edc8dc58c9af5a21b0513491e31449e02'
  checksum64             = 'e0af6c3728447eba10bdffb39a05f7a4db3ea363ea803525d3468d1b5fdf25b2'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}

if (Get-Chrome32bitInstalled) { 'url64bit', 'checksum64', 'checksumType64' | ForEach-Object { $packageArgs.Remove($_) } }
Install-ChocolateyPackage @packageArgs
