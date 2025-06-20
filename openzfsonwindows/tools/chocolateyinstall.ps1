﻿$ErrorActionPreference = 'Stop'; 
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file64        = Join-Path $toolsDir 'OpenZFSOnWindows-ARM64-debug-2.3.1rc9.exe'
  softwareName  = 'OpenZFS On Windows'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0) 
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item $packageArgs.file64 -force -ea 0 
