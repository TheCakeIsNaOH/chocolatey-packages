$ErrorActionPreference = 'Stop'; 
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$cerLocation           = Join-Path $toolsDir 'ZFSin.cer'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file64        = Join-Path $toolsDir 'OpenZFSOnWindows-release-20200731.exe'
  softwareName  = 'OpenZFS On Windows'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0) 
}

certutil.exe -addstore -f "TrustedPublisher" $cerLocation

Install-ChocolateyInstallPackage @packageArgs

Remove-Item $fileLocation -force -ea 0 