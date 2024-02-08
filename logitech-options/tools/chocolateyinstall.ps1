$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Confirm-Win10

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download01.logi.com/web/ftp/pub/techsupport/options/options_installer.exe'
    checkum        = '062bb8652108eaa6c77dc5528c18b33d4b9ad73c0687f51d54dafee7223a2019'
    checksumType   = 'sha256'
    fileType       = 'EXE'
    silentArgs     = '/quiet /update:false'
    validExitCodes = @(0)   
}

Install-ChocolateyPackage @packageArgs
