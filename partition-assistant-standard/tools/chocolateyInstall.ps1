$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url			 = 'https://www.aomeitech.com/ss/download/pa/PAssist_Std.exe'
  checksum       = '37c145b6762fd7ee80d4ee33698e30b05e2e9e1bd2417c2c0e0a200f383cd44d'
  checksumType   = 'sha256'
  silentArgs	 = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName   = 'AOMEI Partition Assistant Standard*'
  validExitCodes = @(0)
  options        = @{
    Headers = @{ "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" }
  }
}

Write-Host -ForegroundColor Cyan "Warning messages about failed 'Attempt to get headers' can be ignored."
Write-Host -ForegroundColor Cyan "These messages are due to a limitation in Chocolatey CLI"
Write-Host -ForegroundColor Cyan "Go thumbs up the issue: https://github.com/chocolatey/choco/issues/3191"

Install-ChocolateyPackage @packageArgs
