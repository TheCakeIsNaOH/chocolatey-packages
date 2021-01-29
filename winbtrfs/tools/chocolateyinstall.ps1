$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = (Get-ChildItem $toolsDir -Filter "*.zip").FullName
$driverFile            = Join-Path $toolsDir 'btrfs.cat'
$outputFile            = Join-Path $toolsDir 'MarkHarmstone.cer'
$exportType            = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert

Get-ChocolateyUnzip -FileFullPath $fileLocation -Destination $toolsDir -PackageName $env:ChocolateyPackageName

Write-Host -ForegroundColor green "Extracting cert from driver"
$cert = (Get-AuthenticodeSignature $driverFile).SignerCertificate

$checkCert = Get-ChildItem Cert:\CurrentUser\TrustedPublisher -Recurse | Where-Object { $_.Thumbprint -eq $cert.Thumbprint }
if (!($checkCert)) {
    [System.IO.File]::WriteAllBytes($outputFile, $cert.Export($exportType))
    Write-Host -ForegroundColor green "Cert not found, adding to trusted store"
    certutil -addstore -f "TrustedPublisher" $toolsDir\MarkHarmstone.cer
} else {
    Write-Host -ForegroundColor green "Cert already trusted"
}

$checkCert = Get-ChildItem Cert:\CurrentUser\TrustedPublisher -Recurse | Where-Object { $_.Thumbprint -eq $cert.Thumbprint }
if (!($checkCert)) {
    Write-Error "Certificate failed to install"
}

Write-Host -ForegroundColor green "Adding btrfs driver"
#pnputil -i -a $toolsDir\btrfs.inf 
#& rundll32.exe advpack.dll`,LaunchINFSectionEx "$toolsDir\btrfs.inf"`,`,4`,N
rundll32.exe advpack.dll`,LaunchINFSectionEx "$toolsDir\btrfs.inf"`,`,`,4`,N
#rundll32.exe advpack.dll,LaunchINFSectionEx "$toolsDir\btrfs.inf",,,4,N



#rundll32.exe advpack.dll,LaunchINFSectionEx "C:\Users\User\Desktop\btrfs-1.7.6\btrfs.inf",DefaultInstall.Services,,4,N
#rundll32.exe advpack.dll,LaunchINFSectionEx "C:\Users\User\Desktop\btrfs-1.7.6\btrfs.inf",Standard.NTamd64,,4,N
#rundll32.exe advpack.dll,LaunchINFSectionEx "C:\Users\User\Desktop\btrfs-1.7.6\btrfs.inf",,,4,N
#rundll32.exe advpack.dll,LaunchINFSectionEx "C:\Users\User\Desktop\btrfs-1.7.6\btrfs.inf",Manufacturer,,4,N

$btrfsDrivers = Get-WmiObject win32_pnpsigneddriver | where { $_.DeviceName -like "*btrfs*" -and $_.InfName -like "*oem*"}
if (!($btrfsDrivers)) {
    Write-Warning "Driver apparently failed to install; check that secure boot is off"
    Write-Warning "Please re-install or manually install driver from $env:ChocolateyInstall\lib\winbtrfs\tools\btrfs.inf"
} else {
    #Check version
}

Write-Host -ForegroundColor green "Removing files for other architectures"
if (Get-OSArchitectureWidth 64) {
	Remove-Item -Recurse -Path $toolsDir\arm
    Remove-Item -Recurse -Path $toolsDir\x86
    if ($env:PROCESSOR_ARCHITECTURE -ne "AMD64") {
        Remove-Item -Recurse -Path $toolsDir\x64
    } else {
        Remove-Item -Recurse -Path $toolsDir\aarch64
    }
} else {
	Remove-Item -Recurse -Path $toolsDir\x64
    Remove-Item -Recurse -Path $toolsDir\aarch64
    if ($env:PROCESSOR_ARCHITECTURE -ne "x86") {
        Remove-Item -Recurse -Path $toolsDir\x86
    } else {
        Remove-Item -Recurse -Path $toolsDir\arm
    }
}

(Get-ChildItem -Recurse -Path $toolsDir -Filter '*.exe').FullName | ForEach-Object { Out-File "$_.ignore" }
