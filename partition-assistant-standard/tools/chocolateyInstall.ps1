﻿$ErrorActionPreference = 'Stop'
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName	 = $env:ChocolateyPackageName
  fileType		 = 'exe'
  url			 = 'https://www.aomeitech.com/ss/download/pa/PAssist_Std.exe'
  checksum       = 'a055bf219d2bf03f2ea253ab776252e49c0e476d787c838c93ac4e56a2fc5930'
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
