$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition
$pp                    = Get-PackageParameters
$mstPath               = (Join-Path $toolsDir 'ReflectFreeEnableSilent.mst')

if ((Get-WmiObject win32_operatingsystem).caption -match "Server") {
	Write-Host -ForegroundColor red "Non compatible Windows Server OS detected"
	throw  "Install failed due to Server OS"
}

$silentArgs = "/qn /norestart NOIMAGEGUARDIAN=YES NOVIBOOT=YES NOCBT=YES TRANSFORMS=`"$mstPath`" /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""

if (!$pp['desktopicon']) {
    Write-Host -ForegroundColor green 'Not adding a desktop shortcut'
    $silentArgs = $silentArgs + " NODESKTOPSHORTCUT=YES"
}

$packageArgs = @{
    packageName    = 'reflect-free'
    fileType       = 'exe'
    url            = 'https://download.macrium.com/reflect/v8/v8.0.6161/reflect_setup_free_x86.exe'
    url64          = 'https://download.macrium.com/reflect/v8/v8.0.6161/reflect_setup_free_x64.exe'
    checksum       = '94553ba7e5227404185409993689a10335a49b072559f0cc9fcc39510c7436df'
    checksum64     = '48ea5e7349f874fab6ca58f590f8855b40d8387ca89dcc48f1cee222284206ec'
    checksumtype   = 'sha256'
    validExitCodes = @(0)
    silentArgs     = $silentArgs
}

Install-ChocolateyPackage @packageArgs
