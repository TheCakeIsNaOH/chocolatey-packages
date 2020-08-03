$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName              = (Get-ChildItem $toolsDir -Filter "*.exe")

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = (Join-Path $toolsDir $fileName)
  softwareName  = 'BibleTime*'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item $fileName -ea 0
