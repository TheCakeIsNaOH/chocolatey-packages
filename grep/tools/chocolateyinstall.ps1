$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$file = Join-Path $toolsDir "grep.exe"

Install-Binfile -Name egrep -Path $file -Command "-E"
Install-Binfile -Name fgrep -Path $file -Command "-F"
