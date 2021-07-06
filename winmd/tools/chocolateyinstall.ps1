$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = Join-Path $toolsDir 'winmd-0.1.zip'
$driverFile            = Join-Path $toolsDir 'winmd.cat'
$outputFile            = Join-Path $toolsDir 'MarkHarmstone.cer'
$exportType            = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert

Get-ChocolateyUnzip $fileLocation $toolsDir

Write-Host -ForegroundColor green "Extracting cert from driver"
$cert = (Get-AuthenticodeSignature $driverFile).SignerCertificate;
[System.IO.File]::WriteAllBytes($outputFile, $cert.Export($exportType));

Write-Host -ForegroundColor green "Adding cert to trusted store"
certutil -addstore -f "TrustedPublisher" $outputFile

Write-Host -ForegroundColor green "Adding WinMD driver"
pnputil -i -a $toolsDir\winmd.inf 

if (Get-OSArchitectureWidth 64) {
	Write-Host -ForegroundColor green "Removing x32 files"
	Remove-Item -Recurse -Path $toolsDir\x86
} else {
	Write-Host -ForegroundColor green "Removing x64 files"
	Remove-Item -Recurse -Path $toolsDir\x64
}
