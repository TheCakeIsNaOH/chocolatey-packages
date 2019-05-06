$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
}

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

write-host	"Listing drivers"
$btrfsDrivers = Get-WmiObject win32_pnpsigneddriver | where {$_.DeviceName -like "*btrfs*" -and $_.InfName -like
 "*oem*"}

foreach($InfName in $btrfsDrivers)
{
	Write-Host "Removing btrfs driver" $btrfsDrivers.InfName
	pnputil -f -d $btrfsDrivers.InfName
}