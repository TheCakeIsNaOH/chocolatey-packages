$ErrorActionPreference = 'Stop';
$toolsDir   		   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$copyLog			   = join-path $toolsDir 'List_of_paths_copied_to.txt'
$copyPaths			   = Get-Content -Path $copyLog

foreach ($path in $copyPaths) {
	$dllPath = join-path $path 'libdvdcss-2.dll' 
	if (test-path $dllpath) {
		Write-Host -ForegroundColor green 'Removing libdvdcss-2.dll from ' $path
		Remove-Item -Path $dllPath
	} else {
		Write-Host -ForegroundColor yellow 'Did not find libdvdcss-2.dll in ' $path
		Write-Host -ForegroundColor yellow 'Must have already been removed'
	}
}

Remove-Item -Path $copyLog