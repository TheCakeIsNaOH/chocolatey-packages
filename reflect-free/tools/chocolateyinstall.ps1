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
    url            = 'https://download.macrium.com/reflect/v8/v8.0.6584/reflect_setup_free_x86.exe'
    url64          = 'https://download.macrium.com/reflect/v8/v8.0.6584/reflect_setup_free_x64.exe'
    checksum       = '2f24f06833e71b5cbbf086f64e9e88d9e527abb65085e96f03e2cf677083700d'
    checksum64     = '6f4b8272760fab557027ef6455a81a4a062fd01729c18a14583fccd296553fbe'
    checksumtype   = 'sha256'
    validExitCodes = @(0)
    silentArgs     = $silentArgs
}

Install-ChocolateyPackage @packageArgs
