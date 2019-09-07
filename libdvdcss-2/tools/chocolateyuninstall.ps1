$ErrorActionPreference = 'Stop';
$sys32 = [System.Environment]::SystemDirectory
$dll = Join-Path $sys32 'libdvdcss-2.dll'

Write-Host -ForegroundColor green 'Removing libdvdcss-2.dll from system32'
Remove-Item -Path $dll