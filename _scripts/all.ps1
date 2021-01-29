ls (Join-Path $PSScriptRoot '*.ps1') -Exclude all.ps1 | % { . $_ }
