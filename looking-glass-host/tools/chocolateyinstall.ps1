$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp                    = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file64        = Join-Path $toolsDir 'looking-glass-host-setup.exe'
  softwareName  = 'Looking Glass (host)'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

if ($pp['desktop']) {
    $packageArgs['silentArgs'] = $packageArgs['silentArgs'] + ' /desktop'
}

if ($pp['startmenu']) {
    $packageArgs['silentArgs'] = $packageArgs['silentArgs'] + ' /startmenu'
}

if ($pp['noservice']) {
    $packageArgs['silentArgs'] = $packageArgs['silentArgs'] + ' /noservice'
}

if ($pp['path']) {
    If (!(Test-Path -IsValid $pp['path'])) {
        Write-Error "Invalid path parameter, please check that you passed a valid path"
    }
    $packageArgs['silentArgs'] = $packageArgs['silentArgs'] + " /D=$($pp['path'])"
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -ea 0 -Path $toolsDir\*.exe
