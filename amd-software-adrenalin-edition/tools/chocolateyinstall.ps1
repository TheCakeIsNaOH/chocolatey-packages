$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url64			 = 'https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-26.7.1-win11-c.exe'
  checksum64     = '20be64716c9c8339c0a74b08599a9aa5c2750e2b909a762c95978a9c84be797b'
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
