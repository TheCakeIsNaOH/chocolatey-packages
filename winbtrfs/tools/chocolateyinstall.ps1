$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = Join-Path $toolsDir 'btrfs-1.7.8.1.zip'
$driverFile            = Join-Path $toolsDir 'btrfs.cat'
$outputFile            = Join-Path $toolsDir 'MarkHarmstone.cer'
$exportType            = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert
$akhscript             = Join-Path $toolsDir 'no-reboot.ahk'

Get-ChocolateyUnzip $fileLocation $toolsDir

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

Write-Host -ForegroundColor green "Adding btrfs driver"
& infdefaultinstall.exe $toolsDir\btrfs.inf 

Write-Host "Running Autohotkey script"
& AutoHotkey $akhscript

Write-Host -ForegroundColor green "Removing files for other architectures"
Remove-Item -Recurse -Path $toolsDir\aarch64
Remove-Item -Recurse -Path $toolsDir\arm

if (Get-OSArchitectureWidth 64) {
	Remove-Item -Recurse -Path $toolsDir\x86
} else {
	Remove-Item -Recurse -Path $toolsDir\x64
}

(Get-ChildItem -Recurse -Path $toolsDir -Filter '*.exe').FullName | ForEach-Object { Out-File "$_.ignore" }
