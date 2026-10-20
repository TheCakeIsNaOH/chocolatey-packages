$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url64			 = 'https://drivers.amd.com/drivers/whql-amd-software-adrenalin-edition-26.10.1-win11-c.exe'
  checksum64     = 'eaf0b61de6ce31793d05222fd57b50c6a55095f52796a33683093381f9345b82'
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
