$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation          = (Get-ChildItem $toolsDir -Filter "*.exe").FullName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = '/S'
}

Install-ChocolateyInstallPackage @packageArgs