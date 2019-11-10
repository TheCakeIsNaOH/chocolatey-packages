$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = (Get-ChildItem $toolsDir -Filter "*.zip").FullName
$driverFile            = Join-Path $toolsDir 'btrfs.cat'
$outputFile            = Join-Path $toolsDir 'MarkHarmstone.cer'
$exportType            = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert

Get-ChocolateyUnzip $fileLocation $toolsDir

Write-Host "Removing bundled debug files"
Remove-Item -Recurse -Path $toolsDir\Debug

Write-Host "Extracting cert from driver"
$cert = (Get-AuthenticodeSignature $driverFile).SignerCertificate;
[System.IO.File]::WriteAllBytes($outputFile, $cert.Export($exportType));

Write-Host "Adding cert to trusted store"
certutil -addstore -f "TrustedPublisher" $toolsDir\MarkHarmstone.cer

Write-Host "Adding btrfs driver"
pnputil -i -a $toolsDir\btrfs.inf 

if (Get-OSArchitectureWidth 64) {
	Write-Host "Removing x32 files"
	Remove-Item -Recurse -Path $toolsDir\x86
} else {
	Write-Host "Removing x64 files"
	Remove-Item -Recurse -Path $toolsDir\x64
}
