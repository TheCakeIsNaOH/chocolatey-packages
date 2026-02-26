$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url64			 = 'https://drivers.amd.com/drivers/amd-software-adrenalin-edition-26.2.1-win11-c.exe'
  checksum64     = '87bc69333b0b32a8150da33b78938d839babc18aa2bff083a419068817b0ca39'
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
