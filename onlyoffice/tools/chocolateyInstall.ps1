$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'onlyoffice'
  fileType       = 'exe'
  url            = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.2.0/DesktopEditors_x86.exe'
  url64          = 'https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v9.2.0/DesktopEditors_x64.exe'
  softwareName   = 'Onlyoffice*'
  checksum       = '4e96693440b8fb176d7556fd0299ae04a61986c38134bac2c83c31ccae9ea7d8'
  checksumType   = 'sha256'
  checksum64     = '89bc22d907be762a6634e220c731c04091d1211218fbd72842e184441bf6263d'
  checksumType64 = 'sha256'
  silentArgs     = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
