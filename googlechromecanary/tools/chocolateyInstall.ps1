﻿$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '134.0.6990.2-canary'
if ($version -le (Get-ChromeCanaryVersion)) {
  Write-Host "Google Chrome Canary $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'EXE'
  url                    = 'https://dl.google.com/tag/s/appguid=%7B4EA16AC7-FD5A-47C3-875B-DBF4A2008C20%7D&usagestats=1&ap=-statsdef_1/update2/installers/ChromeSetup.exe'
  checksum               = 'b39b65643ca0e4897896d00a672829c97fbde8e286845966a15421056387c065'
  checksumType           = 'sha256'
  silentArgs             = "/silent /install"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
