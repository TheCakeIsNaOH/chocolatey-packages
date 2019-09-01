
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'Linux_Reader.exe'
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcut = join-path $desktop "DiskInternals Research.lnk"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file 			= $fileLocation
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Write-Host "removing " $shortcut
Remove-item $shortcut