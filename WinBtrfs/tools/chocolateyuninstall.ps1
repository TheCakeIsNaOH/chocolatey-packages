$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
}

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

write-host -ForegroundColor green	"Listing drivers"
$btrfsDrivers = Get-WmiObject win32_pnpsigneddriver | where {$_.DeviceName -like "*btrfs*" -and $_.InfName -like
 "*oem*"}

foreach($InfName in $btrfsDrivers)
{
	Write-Host -ForegroundColor green "Removing btrfs driver" $btrfsDrivers.InfName
	pnputil -f -d $btrfsDrivers.InfName
}