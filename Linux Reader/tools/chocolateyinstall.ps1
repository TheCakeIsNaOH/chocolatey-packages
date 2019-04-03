
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.diskinternals.com/download/Linux_Reader.exe'
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcut = join-path $desktop "DiskInternals Research.lnk"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Linux Reader*'

  checksum      = 'b2b9ce715a0f50edc10afcc6446f3ff1bb9f6117a2c38f628a3c6deedc26de31'
  checksumType  = 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

Write-Host "removing " $shortcut
Remove-item $shortcut