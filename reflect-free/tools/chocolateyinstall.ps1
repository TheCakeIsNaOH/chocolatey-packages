$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition
$pp                    = Get-PackageParameters
$macriumPath           = (Join-Path $env:programfiles 'macrium\reflect')
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
    url            = 'https://download.macrium.com/reflect/v8/v8.0.6036/reflect_setup_free_x86.exe'
    url64          = 'https://download.macrium.com/reflect/v8/v8.0.6036/reflect_setup_free_x64.exe'
    checksum       = '3b587a058212680346c2d2cbe014eae95ffe4bf56eb2b384b969c3a378158717'
    checksum64     = '43e718323579a1aa3e6d1fd72b8d66b9da776e19d2ba0c4a69ceeb77e00dec3b'
    checksumtype   = 'sha256'
    validExitCodes = @(0)
    silentArgs     = $silentArgs
}

Install-ChocolateyPackage @packageArgs
