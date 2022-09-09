$ErrorActionPreference = 'Stop'
$toolsDir              = Split-Path -parent $MyInvocation.MyCommand.Definition
$pp                    = Get-PackageParameters
$silentArgs            = '/qn'

if ($pp['StartMenu'] -or $pp['ClassicExplorer'] -or $pp['ClassicIE']) {
    $silentArgs = $silentArgs + ' ADDLOCAL='
    
    if ($pp['StartMenu']) {
        $silentArgs = $silentArgs + 'StartMenu,'
    }
    if ($pp['ClassicExplorer']) {
        $silentArgs = $silentArgs + 'ClassicExplorer,'
    }
    if ($pp['ClassicIE']) {
        $silentArgs = $silentArgs + 'ClassicIE'
    }
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file           = Join-Path $toolsDir 'OpenShellSetup_4_4_177.exe'
  softwareName   = 'Open-Shell*'
  silentArgs     = $silentArgs
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item "$toolsDir\*.exe" -Force -EA SilentlyContinue | Out-Null
