$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileType      = 'EXE'
    url           = 'https://www.aomeiget.com/download/adb/AOMEIBackupperStd.exe'
    softwareName  = 'AOMEI Backupper Standard*'
    checksum      = '660208acbd0d566823ae0628e9430d903a98d1f322dfdc90f54c2c62d8e49466'
    checksumType  = 'sha256'
    silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
