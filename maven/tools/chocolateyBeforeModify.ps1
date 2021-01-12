$ErrorActionPreference = 'Stop'
$version = '3.6.3'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $toolsDir
$installFolder = Join-Path $package "apache-maven-$version"

# Delete current version before upgrading or uninstalling
Remove-Item $installFolder -Force -Recurse
