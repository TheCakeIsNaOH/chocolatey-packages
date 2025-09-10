$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '142.0.7405.0-canary'
if ($version -le (Get-ChromeCanaryVersion)) {
  Write-Host "Google Chrome Canary $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'EXE'
  url                    = 'https://dl.google.com/tag/s/appguid=%7B4EA16AC7-FD5A-47C3-875B-DBF4A2008C20%7D&usagestats=1&ap=-statsdef_1/update2/installers/ChromeSetup.exe'
  checksum               = '41fe15fbc2a33e63735c4132b73924b4e4ff58a3f956cea048bb86db37e107a3'
  checksumType           = 'sha256'
  silentArgs             = "/silent /install"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
