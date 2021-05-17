$pp 				   = Get-PackageParameters
$ErrorActionPreference = 'Stop';
$toolsDir   		   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$dllPath64			   = join-path $toolsDir '64-bit\libdvdcss-2.dll'
$dllPath32 			   = join-path $toolsDir '32-bit\libdvdcss-2.dll'
$handbrakeDirPortable  = join-path $env:ChocolateyInstall 'lib\handbrake.portable\tools'
$handbrakeDir		   = join-path "$env:ProgramFiles" 'HandBrake'
$handbrakeDir32		   = join-path "$env:ProgramFiles(x86)" 'HandBrake'
$copyLog			   = join-path $toolsDir 'List_of_paths_copied_to.txt'


Function Copy-Dll {
	param ($copyToDir, $dllPath)
	if (Test-Path $copyToDir) {
		Write-Host -ForegroundColor green 'Copying libdvdcss-2 to ' $copyToDir
		Copy-Item $dllPath $copyToDir
		Out-File -FilePath $copyLog -InputObject $copyToDir -Append 
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $copyToDir
	}
}


if (Test-Path $copyLog) { Remove-Item -Path $copyLog }


if ($pp['CopyDir64']) { 
	if (Test-Path $pp['CopyDir64']) { 
		Copy-Dll $pp['CopyDir64'] $dllPath64
	} else {
		Write-Host -ForegroundColor red 'Bad path param ' $pp['CopyDir64']
	}
}

if ($pp['CopyDir32']) { 
	if (Test-Path $pp['CopyDir32']) { 
		Copy-Dll $pp['CopyDir32'] $dllPath32
	} else {
		Write-Host -ForegroundColor red 'Bad path param ' $pp['CopyDir32']
	}
}

if ($pp['NoHandbrakeCopy']) {
	Write-Host -ForegroundColor green 'Copying to HandBrake install directories disabled by user parameter'
} else {
	if (Get-OSArchitectureWidth 64) { 
		if ($env:ChocolateyForceX86) {
			Copy-Dll $handbrakeDirPortable $dllPath32
			Copy-Dll $handbrakeDir32 $dllPath32
		} else {
			Copy-Dll $handbrakeDirPortable $dllPath64
			Copy-Dll $handbrakeDir $dllPath64
		}
	} else {
		Copy-Dll $handbrakeDirPortable $dllPath32
		Copy-Dll $handbrakeDir $dllPath32
	}
}