$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '126.0.6478.8-canary'
if ($version -le (Get-ChromeCanaryVersion)) {
  Write-Host "Google Chrome Canary $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'googlechrome'
  fileType               = 'EXE'
  url                    = 'https://dl.google.com/tag/s/appguid=%7B4EA16AC7-FD5A-47C3-875B-DBF4A2008C20%7D&usagestats=1&ap=-statsdef_1/update2/installers/ChromeSetup.exe'
  checksum               = '1719813e108fd2d92366fa104e6e51d39730083716db6ee59cc66dab14381ab3'
  checksumType           = 'sha256'
  silentArgs             = "/silent /install"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
