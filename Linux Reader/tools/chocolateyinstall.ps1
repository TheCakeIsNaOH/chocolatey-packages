
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

  checksum      = '50B7F186CFD960E4F08F2B325BA75663EA759FCC6FA13E8488849C2F7CCC0BA9'
  checksumType  = 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

Write-Host "removing " $shortcut
Remove-item $shortcut