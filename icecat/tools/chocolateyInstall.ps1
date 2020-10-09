$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/muslayev/icecat-win64/releases/download/v78.3.0/icecat-78.3.0.en-US.win64.installer.exe'
  checksum64     = 'c0ef5900b2e56971651dadd2558b43804d896cbb9717e16cf475ddbe1963df5f'
  checksumType64 = 'sha256'
  silentArgs     = '-ms'
}

Install-ChocolateyPackage @packageArgs

Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }