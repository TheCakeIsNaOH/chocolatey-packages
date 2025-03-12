$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '136.0.7064.0-canary'
if ($version -le (Get-ChromeCanaryVersion)) {
  Write-Host "Google Chrome Canary $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'EXE'
  url                    = 'https://dl.google.com/tag/s/appguid=%7B4EA16AC7-FD5A-47C3-875B-DBF4A2008C20%7D&usagestats=1&ap=-statsdef_1/update2/installers/ChromeSetup.exe'
  checksum               = 'bc6d7637609cbdc4bdc7284db4c92293e4240a40ae028dae04bd88af2f277235'
  checksumType           = 'sha256'
  silentArgs             = "/silent /install"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
