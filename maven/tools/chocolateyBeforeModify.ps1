$ErrorActionPreference = 'Stop'
$version = '3.6.3'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $toolsDir
$installFolder = "apache-maven-$version"
. $toolsDir\helpers.ps1

# Delete current version before upgrading or uninstalling
Remove-Item "$(Join-Path $package $installFolder)" -Force -Recurse