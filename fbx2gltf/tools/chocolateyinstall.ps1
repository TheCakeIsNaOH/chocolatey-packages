$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$packageArgs = @{
  Url64bit      = 'https://github.com'
  Checksum64    = '1234asdf'
  ChecksumType64= 'sha256'
  UnzipLocation = $toolsDir
  PackageName   = $env:ChocolateyPackageName
}

Install-ChocolateyZipPackage @packageArgs
