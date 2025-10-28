$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = Join-Path $toolsDir '1030to1042.exe'
  softwareName  = 'playnite*'
  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
  softwareExe   = 'Playnite'
}

# Stop-Process called before the install to make sure install goes through successfully.
Write-Output "Killing the $($packageArgs['softwareExe']) process..."
$null = Remove-Process -NameFilter $packageArgs['softwareExe'] 
Install-ChocolateyInstallPackage @packageArgs
Write-Output "Sleeping and preparing to kill elevated $($packageArgs['softwareExe']) process..."
Start-Sleep -Seconds 5
$null = Remove-Process -NameFilter $packageArgs['softwareExe']

$null = Remove-Item -Force -EA 0 -Path $packageArgs['file'] 
