$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '142.0.7420.3-dev'
if ($version -le (Get-ChromeDevVersion)) {
  Write-Host "Google Chrome Dev $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'MSI'
  url                    = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise.msi'
  url64bit               = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise64.msi'
  checksum               = '2665543b0311a2797b5453b88806f2b46ebd2b21cab69d256c3daabd5ca3f00d'
  checksum64             = '434fe58495465b3ab6a77f6e71726ce71a90984c677eb29a535f7fdb83817385'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}

if (Get-Chrome32bitInstalled) { 'url64bit', 'checksum64', 'checksumType64' | ForEach-Object { $packageArgs.Remove($_) } }
Install-ChocolateyPackage @packageArgs
