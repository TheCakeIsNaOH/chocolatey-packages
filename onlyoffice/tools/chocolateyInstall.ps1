$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'onlyoffice'
  fileType       = 'exe'
  url            = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.1.0/DesktopEditors_x86.exe'
  url64          = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.1.0/DesktopEditors_x64.exe'
  softwareName   = 'Onlyoffice*'
  checksum       = '9c806187699f36d0af8e8c3e9a24b91c77f88745cb64dfc08a5c24aca27f706e'
  checksumType   = 'sha256'
  checksum64     = '731717ce0e5e9ef663268ba00e51418a420708dbd7e69496fe60f4e6680ccb24'
  checksumType64 = 'sha256'
  silentArgs     = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
