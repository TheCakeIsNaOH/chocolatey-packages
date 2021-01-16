$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Write-Host -ForegroundColor green	"Listing drivers"
$btrfsDrivers = Get-WmiObject win32_pnpsigneddriver | where { $_.DeviceName -like "*btrfs*" -and $_.InfName -like "*oem*"}

foreach($driver in $btrfsDrivers)
{
	Write-Host -ForegroundColor green "Removing driver" $driver.DeviceName $driver.InfName 
	pnputil -f -d $driver.InfName
}