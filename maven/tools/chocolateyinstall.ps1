$ErrorActionPreference = 'Stop'
$version = '3.9.11'
$name = "apache-maven-$version"
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$installLocation = Join-Path (Split-Path $toolsDir) $name
$pathToAdd = Join-Path $installLocation 'bin'
$m2_repo = Join-Path $env:USERPROFILE '.m2'
. $toolsDir\helpers.ps1

New-Item -Path $m2_repo -Type directory -Force

# Clean Old Environment variables 
Uninstall-OldM2PathFromRegistry
Uninstall-ChocolateyEnvironmentVariable -VariableName 'M2_HOME' -VariableType Machine

# Adding to path instead of shimming; see comment: https://chocolatey.org/packages/maven#comment-4454809638
Install-ChocolateyPath -PathToInstall $pathToAdd -PathType 'Machine'

if (!(Get-Command javac.exe -ea 0)) {
    Show-JDKWarning
}

$env:ChocolateyPackageInstallLocation = $installLocation
