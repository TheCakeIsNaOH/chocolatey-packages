$ErrorActionPreference = 'Stop'
$extractDir = Join-Path $env:TEMP "$($env:ChocolateyPackageName)_$($env:ChocolateyPackageVersion)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://ftp.nluug.nl/pub/games/PC/guru3d/afterburner/%5BGuru3D%5D-RTSSSetup737Build28314.zip'
    checksum      = '9B084A8CB3E53EC1A673894D0B66E22B16C9FD8785636B020B2D422F3F2A820E'
    checksumType  = 'sha256'
    unzipLocation = $extractDir
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'exe'
    file           = Join-Path $extractDir 'RTSSSetup737.exe'
    silentArgs     = '/S'
    validExitCodes = @(0)
    softwareName   = 'RivaTuner Statistics Server*'
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item $extractDir -Recurse -Force -ErrorAction SilentlyContinue
