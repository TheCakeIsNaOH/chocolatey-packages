$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '159.0.8144.0-dev'
if ($version -le (Get-ChromeDevVersion)) {
  Write-Host "Google Chrome Dev $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'MSI'
  url                    = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise.msi'
  url64bit               = 'https://dl.google.com/tag/s/dl/chrome/install/dev/googlechromedevstandaloneenterprise64.msi'
  checksum               = 'b0d754a390e31b67152f6d82551e10bfa70988b7295f24e2140885ce9fe3317a'
  checksum64             = 'ba5ff21aa514705637aeb6d285894f589342581abc4e6d283847dc80cf09b476'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}

if (Get-Chrome32bitInstalled) { 'url64bit', 'checksum64', 'checksumType64' | ForEach-Object { $packageArgs.Remove($_) } }
Install-ChocolateyPackage @packageArgs
