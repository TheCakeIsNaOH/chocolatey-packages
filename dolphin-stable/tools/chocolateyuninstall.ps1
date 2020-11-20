$ErrorActionPreference = 'Stop';
$toolsDir 			   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$dolphinFolder         = (Join-Path ([Environment]::GetFolderPath("ProgramFiles")) 'Dolphin')
$exePath               = Join-Path $dolphinFolder  'Dolphin.exe'

Uninstall-BinFile -Name 'Dolphin-Dev' -Path $exepath
