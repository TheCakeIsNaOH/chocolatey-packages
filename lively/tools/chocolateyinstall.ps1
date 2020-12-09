$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$IsWin10=[Environment]::OSVersion.Version.Major
if ($IsWin10 -ne "10") {
    Write-Warning "This package requires Windows 10."
	throw
}

$IsCorrectBuild=[Environment]::OSVersion.Version.Build
if ($IsCorrectBuild -lt "18362") {
    Write-Warning "This package requires at least Windows 10 version 1903"
	throw
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = "$toolsDir\lively_setup_x86_full_v1160.exe"
  softwareName  = 'Lively Wallpaper*'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -EA 0 -Path $toolsDir\*.exe
