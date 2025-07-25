$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Confirm-Win10

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download01.logi.com/web/ftp/pub/techsupport/options/options_installer.exe'
    checksum       = '1b91a3f23548276555f2675453bb312380fe4443d8f0c753b4a2832625d3b967'
    checksumType   = 'sha256'
    fileType       = 'EXE'
    silentArgs     = '/quiet /update:false'
    validExitCodes = @(0)   
}

Install-ChocolateyPackage @packageArgs
