$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url			 = 'https://www.aomeitech.com/ss/download/pa/PAssist_Std.exe'
  checksum       = 'b91588734d2bdd47e9c9e7e82b17fe1bcd1a61f1e07da774dff3ebe65c8b48fc'
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
