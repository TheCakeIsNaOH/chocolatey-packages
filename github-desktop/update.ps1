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
    #$download_page = Get-GitHubLatestReleaseLinks -User "desktop" -Repository "desktop"
    
    #$url64         = $download_page.Links | Where-Object href -match ".*.exe$" | Select-Object -First 1 -ExpandProperty href
    #$version       = (Get-Version $url64).version.tostring()
    #$modurl        = 'https://github.com' + $url64

    $release_tag_url = Get-RedirectedUrl -url "https://github.com/desktop/desktop/releases/latest"
    $version         = (Get-Version ($release_tag_url -split "/" | Select-Object -Last 1)).Version.ToString()
    #$download_page   = Invoke-WebRequest -Usebasicparsing -Uri "https://desktop.githubusercontent.com/?page=1"
    $download_info   = Invoke-RestMethod -Method Get -Usebasicparsing -Uri "https://central.github.com/deployments/list?page=1"
    $deployment      = $download_info.deployments | Where-Object version -eq $version
    $url64           = $deployment.artifacts | Where-Object is_windows -eq "True" | Where-Object Name -Match ".*x64.exe$" | Select-Object -ExpandProperty url -First 1
    
    return @{
        Version = $version
        URL64   = $modUrl
    }
}

Update-Package -ChecksumFor none