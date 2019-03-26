
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'btrfs-1.1.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
}

Get-ChocolateyUnzip $fileLocation $toolsDir

Write-Host "Removing bundled debug files"
Remove-Item -Recurse -Path $toolsDir\Debug

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











    








