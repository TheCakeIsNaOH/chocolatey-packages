$ErrorActionPreference = 'Stop'; 
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = Join-Path $toolsDir 'OpenZFSOnWindows-release.exe'
$cerLocation           = Join-Path $toolsDir 'ZFSin.cer'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file64        = $fileLocation
  softwareName  = 'OpenZFS On Windows'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0) 
}

certutil -addstore -f "TrustedPublisher" $cerLocation

Install-ChocolateyInstallPackage @packageArgs