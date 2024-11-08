$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Confirm-Win10

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download01.logi.com/web/ftp/pub/techsupport/options/options_installer.exe'
    checksum       = '4E965AEFE0233DD7D936FE92727A3DED6D5779B0ECDAABCA747FBADFCB857E22'
    checksumType   = 'sha256'
    fileType       = 'EXE'
    silentArgs     = '/quiet /update:false'
    validExitCodes = @(0)   
}

Install-ChocolateyPackage @packageArgs
