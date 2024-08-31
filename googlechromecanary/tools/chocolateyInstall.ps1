$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '130.0.6689.0-canary'
if ($version -le (Get-ChromeCanaryVersion)) {
  Write-Host "Google Chrome Canary $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'EXE'
  url                    = 'https://dl.google.com/tag/s/appguid=%7B4EA16AC7-FD5A-47C3-875B-DBF4A2008C20%7D&usagestats=1&ap=-statsdef_1/update2/installers/ChromeSetup.exe'
  checksum               = 'd24d64f52978dd1d08d757a2ca4724a6dff862f1cffdeff3473719afe4a03867'
  checksumType           = 'sha256'
  silentArgs             = "/silent /install"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
