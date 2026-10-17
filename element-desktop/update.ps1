import-module chocolatey-au

$releases = 'https://github.com/element-hq/element-web/tags'

function global:au_SearchReplace {
   @{
        "tools\chocolateyInstall.ps1" = @{
          "(?i)(^\s*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
          "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }	
    }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $version = $download_page.links.href -match 'tag/v' -notmatch 'rc' | Select -First 1 | % { $_ -split '/' | select -Last 1 }
    $version = $version.trim("v")

    @{
        Version        = $version
        URL64          = "https://packages.element.io/desktop/install/win32/x64/Element%20Setup%20$version.exe"
    }
}

try {
    update -checksumfor none
} catch  {
    if ($_ -match '404') { Write-Host "$_"; return 'ignore' }
}
