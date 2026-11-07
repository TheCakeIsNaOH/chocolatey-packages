$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileType      = 'EXE'
    url           = 'https://www.ubackup.com/ss/download/adb/AOMEIBackupperStd.exe'
    softwareName  = 'AOMEI Backupper Standard*'
    checksum      = '79dc73383e78306b69eb0879909a9b723501832713d45d9283b2f8eb37bc065f'
    checksumType  = 'sha256'
    silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
