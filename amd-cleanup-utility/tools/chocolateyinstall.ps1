$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  url64          = 'https://drivers.amd.com/drivers/amdcleanuputility.exe'
  checksum64     = 'fd428d8b5e600488ec31c07bfdc401d7f5742e436f7a0383e044d5bdfdf08e6f'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsDir "amdcleanuputility.exe"
  options        = @{
    Headers = @{ 
      "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
      Accept  = '*/*'
      Referer = 'https://www.amd.com/en/resources/support-articles/faqs/GPU-601.html' 
    }
  }
}

Get-ChocolateyWebFile @packageArgs
