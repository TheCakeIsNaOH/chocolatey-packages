$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Confirm-Win10

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download01.logi.com/web/ftp/pub/techsupport/options/options_installer.exe'
    checksum       = '37265ae012e9a58b3f2ee426ff33f258551948c97210a9e6738849b737d17ac5'
    checksumType   = 'sha256'
    fileType       = 'EXE'
    silentArgs     = '/quiet /update:false'
    validExitCodes = @(0)   
}

Install-ChocolateyPackage @packageArgs
