$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'onlyoffice'
  fileType       = 'exe'
  url            = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.0.4/DesktopEditors_x86.exe'
  url64          = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.0.4/DesktopEditors_x64.exe'
  softwareName   = 'Onlyoffice*'
  checksum       = '77af5a04ada0a017940099a0c370275f62635572f2996a967702d12625df06cc'
  checksumType   = 'sha256'
  checksum64     = 'fe72df413d72b4c9d257a7308d3afac2e8fb3ae42dc99fd65cdb1c7736343597'
  checksumType64 = 'sha256'
  silentArgs     = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
