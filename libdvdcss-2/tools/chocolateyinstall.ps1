$ErrorActionPreference = 'Stop';
$toolsDir   		   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$sys32 				   = [System.Environment]::SystemDirectory
$dll64 				   = join-path $toolsDir 'x64\libdvdcss-2.dll'
$dll32 				   = join-path $toolsDir 'x32\libdvdcss-2.dll'

Write-Host -ForegroundColor green 'Copying libdvdcss-2.dll to system32'
if (Get-OSArchitectureWidth 64) {
Copy-Item $dll64 -Destination $sys32
} else {
Copy-Item $dll32 -Destination $sys32
}
