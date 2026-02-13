$ErrorActionPreference = 'Stop'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file        = 'GPU-Z.2.69.0.exe'

Remove-Item $ENV:ChocolateyInstall\bin\gpu-z*.exe  # delete old shims
Remove-Item $toolsDir\*.ignore                     # delete old .ignore files (2.18.0+)
Remove-Item $toolsDir\*.exe -Exclude $file         # delete old versions kept by upgrade
Write-Host "" | Out-File "$toolsDir\$file.ignore"  # create new .ignore file so shim isn't created

Install-ChocolateyShortcut -shortcutFilePath "$ENV:Public\Desktop\GPU-Z.lnk" -targetPath "$toolsDir\$file"
Install-ChocolateyShortcut -shortcutFilePath "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs\GPU-Z.lnk" -targetPath "$toolsDir\$file"
