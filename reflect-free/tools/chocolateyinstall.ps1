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
    url            = 'https://download.macrium.com/reflect/v8/v8.0.6758/reflect_setup_free_x86.exe'
    url64          = 'https://download.macrium.com/reflect/v8/v8.0.6758/reflect_setup_free_x64.exe'
    checksum       = '7c6390ffd4ff1f358517130785119670d1d30cd9136466f676a6a5a00856107b'
    checksum64     = '2ee0db4a300f759ddc5e32a756ea3aa9f0fe239c8c4a66999583eeccca72ac54'
    checksumtype   = 'sha256'
    validExitCodes = @(0)
    silentArgs     = $silentArgs
}

Install-ChocolateyPackage @packageArgs
