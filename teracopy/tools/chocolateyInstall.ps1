$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName     = 'teracopy'
    url             = 'https://codesector.nyc3.cdn.digitaloceanspaces.com/teracopy4.0.5.exe'
    fileType        = 'exe'
    checksum        = '22F050B51C80A344CBDAF368C7F6A9266EFCA4D95B5109D606466906A421FF7E'
    checksumType    = 'sha256'
    silentArgs      = '/exenoui /exenoupdates /qn /norestart'
    validExitCodes  = @(0)
    softwareName    = 'TeraCopy'
}

Install-ChocolateyPackage @packageArgs
