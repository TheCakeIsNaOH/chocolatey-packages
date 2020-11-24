$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
}

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

write-host -ForegroundColor green	"Listing drivers"
$winmdDrivers = Get-WmiObject win32_pnpsigneddriver | where {$_.DeviceName -like "*winmd*" -and $_.InfName -like
 "*oem*"}

foreach($InfName in $winmdDrivers)
{
	Write-Host -ForegroundColor green "Removing WinMD driver" $winmdDrivers.InfName
	pnputil -f -d $winmdDrivers.InfName
}