$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'onlyoffice'
  fileType       = 'exe'
  url            = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v10.0.0/DesktopEditors_x86.exe'
  url64          = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v10.0.0/DesktopEditors_x64.exe'
  softwareName   = 'Onlyoffice*'
  checksum       = '6daa9c963ccdf991bab4273a87cc1c9ec8ccdf27c6b82fafb49bdf63c5b8bdeb'
  checksumType   = 'sha256'
  checksum64     = 'e9f6df29bb09770cfc14c9ebb9bce881ff7ad9705d76b3faf038831fe248e46b'
  checksumType64 = 'sha256'
  silentArgs     = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
