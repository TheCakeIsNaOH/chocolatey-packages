Import-Module chocolatey-au
. $([System.IO.Path]::Combine("..", '_scripts', 'Get-GitHubLatestReleaseLinks.ps1'))

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyinstall.ps1" = @{
        "(?i)(^\s*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
        "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
    $download_page = Get-GitHubLatestReleaseLinks -User "desktop" -Repository "desktop"
    
    $url64         = $download_page.Links | Where-Object href -match ".*.exe$" | Select-Object -First 1 -ExpandProperty href
    $version       = (Get-Version $url64).version.tostring()
    $modurl        = 'https://github.com' + $url64
    
    return @{
        Version = $version
        URL64   = $modUrl
    }
}

Update-Package -ChecksumFor none