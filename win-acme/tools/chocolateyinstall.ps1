$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"

  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  
  Url                    = 'https://github.com/win-acme/win-acme/releases/download/v2.1.12/win-acme.v2.1.12.943.x86.pluggable.zip'
  Checksum               = 'A890DB34B78562F37D4D482EC3121890DC2FF18C91DF79A2FA3BC1F258CEA753'
  ChecksumType           = 'sha256'

  Url64bit               = 'https://github.com/win-acme/win-acme/releases/download/v2.1.12/win-acme.v2.1.12.943.x64.pluggable.zip'
  Checksum64             = 'C761F708EF5ADE7C988AA8093181682F21206F2A1655317A5B8C12D06FC49D4D'
  ChecksumType64         = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
