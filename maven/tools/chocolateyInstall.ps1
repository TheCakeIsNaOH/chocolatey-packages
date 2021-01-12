$ErrorActionPreference = 'Stop'
$version = '3.6.3'
$name = "apache-maven-$version"
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $toolsDir
$m2_home = Join-Path $package $name
$m2_repo = Join-Path $env:USERPROFILE '.m2'
$pathToAdd = Join-Path '%M2_HOME%' 'bin'
. $toolsDir\helpers.ps1

New-Item -Path $m2_repo -Type directory -Force

# Clean Environment variables 
Uninstall-M2PathFromRegistry
Uninstall-ChocolateyEnvironmentVariable -VariableName 'M2_HOME' -VariableType Machine

# Add environment variables for new version
Install-ChocolateyEnvironmentVariable -VariableName 'M2_HOME' -VariableValue $m2_home -VariableType Machine
Install-ChocolateyPath -PathToInstall $pathToAdd -PathType 'Machine'
