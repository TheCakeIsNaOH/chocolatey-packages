$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName     = 'teracopy'
    url             = 'https://codesector.com/files/teracopy3.17.exe'
    fileType        = 'exe'
    checksum        = 'AC03DB52BB68A013D3A8BF4DB703EC11976FA1D0AA557EB988E3F926A26656CF'
    checksumType    = 'sha256'
    silentArgs      = '/exenoui /exenoupdates /qn /norestart'
    validExitCodes  = @(0)
    softwareName    = 'TeraCopy'
}

Install-ChocolateyPackage @packageArgs