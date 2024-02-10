$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$packageArgs = @{
  Url64bit      = 'https://github.com/godotengine/FBX2glTF/releases/download/v0.13.1/FBX2glTF-windows-x86_64.zip'
  Checksum64    = 'effef95553afd4951e92c7330c0ab3152974544d30a7fc8e46c4d57d4332f378'
  ChecksumType64= 'sha256'
  UnzipLocation = $toolsDir
  PackageName   = $env:ChocolateyPackageName
}

Install-ChocolateyZipPackage @packageArgs
