$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$installFolders = Split-Path $toolsDir
. $toolsDir\helpers.ps1

# Delete any folders from older versions before upgrading or uninstalling
Remove-PreviousVersions -installFolders $installFolders