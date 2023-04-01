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
    url            = 'https://download.macrium.com/reflect/v8/v8.0.7279/reflect_setup_free_x86.exe'
    url64          = 'https://download.macrium.com/reflect/v8/v8.0.7279/reflect_setup_free_x64.exe'
    checksum       = 'c5d46ad210ad57259c906359ed6c8f2e5e3880b3b22a517406bb8021d3b45227'
    checksum64     = '732748e0ec40bb978b231d4f3a4e4728d93c98695097e79e04c97c56a56e43b0'
    checksumtype   = 'sha256'
    validExitCodes = @(0)
    silentArgs     = $silentArgs
}

Install-ChocolateyPackage @packageArgs
