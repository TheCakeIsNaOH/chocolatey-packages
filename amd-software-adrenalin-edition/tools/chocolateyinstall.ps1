$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url64			 = 'https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-26.6.4-win11-c.exe'
  checksum64     = '60de4487568e628891bacbad5984dcc5b1c6496bd045ec4960cd99d00097662f'
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
