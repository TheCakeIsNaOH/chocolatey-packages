$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$installFolders = Split-Path $toolsDir
. $toolsDir\helpers.ps1

# Clean Old Environment variables 
Uninstall-OldM2PathFromRegistry
Uninstall-ChocolateyEnvironmentVariable -VariableName 'M2_HOME' -VariableType Machine

# Delete any folders from older versions before upgrading or uninstalling
Remove-PreviousVersions -installFolders $installFolders


