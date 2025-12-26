$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'onlyoffice'
  fileType       = 'exe'
  url            = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.2.1/DesktopEditors_x86.exe'
  url64          = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.2.1/DesktopEditors_x64.exe'
  softwareName   = 'Onlyoffice*'
  checksum       = 'd7bf37768c2bd102d69868a3dccb88711fa81fe4f01f0e5588f1aa65f3ca8f89'
  checksumType   = 'sha256'
  checksum64     = '7ca45e82d4e3b8a1821f2704efc8986f61d7a7e8c9c3488560cbbea33bb8f563'
  checksumType64 = 'sha256'
  silentArgs     = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
