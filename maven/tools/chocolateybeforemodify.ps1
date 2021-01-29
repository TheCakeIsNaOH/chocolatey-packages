$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $toolsDir
$installFolders = Join-Path $package "apache-maven-*"

# Delete any folders from older versions before upgrading or uninstalling
Remove-Item $installFolders -Force -Recurse
