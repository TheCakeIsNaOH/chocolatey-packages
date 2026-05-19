$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'onlyoffice'
  fileType       = 'exe'
  url            = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.4.0/DesktopEditors_x86.exe'
  url64          = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.4.0/DesktopEditors_x64.exe'
  softwareName   = 'Onlyoffice*'
  checksum       = '9c555431bf1dd5c68f0c6a2bf213027bb936e50752175120373a54565b56020f'
  checksumType   = 'sha256'
  checksum64     = 'a3b4a7353946a2d836eadfb8f59799f98b906ab961421c05c0bee00be9307a9f'
  checksumType64 = 'sha256'
  silentArgs     = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
