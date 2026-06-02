$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url64			 = 'https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-26.6.1-win11-c.exe'
  checksum64     = 'b4b4546876a3799121a2e16a469f0c70e10d9afb8bc7c2168488dfcd74726e6b'
  checksumType64 = 'sha256'
  silentArgs	 = '-install'
  softwareName   = 'AMD Software'
  validExitCodes = @(0)
  options        = @{
    Headers = @{ 
      "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
      Accept  = '*/*'
      Referer = 'https://www.amd.com/en/support/download/drivers.html' 
    }
  }
}

Install-ChocolateyPackage @packageArgs
