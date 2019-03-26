# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f



$ErrorActionPreference = 'Stop'; # stop on all errors
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  #softwareName  = 'WinBtrfs*'  #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  #fileType      = 'EXE_MSI_OR_MSU' #only one of these: MSI or EXE (ignore MSU for now)
  # MSI
  #silentArgs    = "/qn /norestart"
  #validExitCodes= @(0, 3010, 1605, 1614, 1641) # https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
  # OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  #silentArgs   = '/S'           # NSIS
  #silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  #silentArgs   = '/s'           # InstallShield
  #silentArgs   = '/s /v"/qn"'   # InstallShield with MSI
  #silentArgs   = '/s'           # Wise InstallMaster
  #silentArgs   = '-s'           # Squirrel
  #silentArgs   = '-q'           # Install4j
  #silentArgs   = '-s -u'        # Ghost
  # Note that some installers, in addition to the silentArgs above, may also need assistance of AHK to achieve silence.
  #silentArgs   = ''             # none; make silent with input macro script like AutoHotKey (AHK)
                                 #       https://chocolatey.org/packages/autohotkey.portable
  #validExitCodes= @(0) #please insert other valid exit codes here
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


