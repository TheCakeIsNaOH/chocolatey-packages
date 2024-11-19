$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
$defaultDestination    = Join-Path $(Get-ToolsLocation) 'win-acme-trimmed'
$pp                    = Get-PackageParameters

if ($pp['Location']) {
	$destination = $pp['Location']
} else {
    $destination = $defaultDestination
}

$exepath = (Join-Path $destination 'wacs.exe')

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $destination
    FileFullPath   = Join-Path $toolsDir 'win-acme.v2.2.9.1701.x86.trimmed.zip'
    FileFullPath64 = Join-Path $toolsDir 'win-acme.v2.2.9.1701.x64.trimmed.zip'
}

Get-ChocolateyUnzip @packageArgs

Install-BinFile -Name 'wacs' -Path $exepath

Remove-Item -ea 0 -force -path $toolsDir\*.zip
