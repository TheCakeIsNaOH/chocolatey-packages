$ErrorActionPreference = 'Stop'; 
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file64        = Join-Path $toolsDir 'OpenZFSOnWindows-debug-.99-137-g4b326b9b92-dirty.exe'
  softwareName  = 'OpenZFS On Windows'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0) 
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item $packageArgs.file64 -force -ea 0 
