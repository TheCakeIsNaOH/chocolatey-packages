$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url			 = 'https://www.aomeitech.com/ss/download/pa/PAssist_Std.exe'
  checksum       = '3014aa6dbe1bb27f0b5dd7bfa2f1fc12b9ee320baee42ea9defcfb26f71ecde8'
  checksumType   = 'sha256'
  silentArgs	 = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName   = 'AOMEI Partition Assistant Standard*'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
